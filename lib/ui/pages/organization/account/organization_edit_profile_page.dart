import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/organizations/update_organization_profile/update_organization_profile_cubit.dart';
import 'package:volunteer_work_app/ui/common_components/title_with_action.dart';

import '../../../../blocs/volunteer_programs/get_organization_programs/get_organization_programs_cubit.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/org_program_item_card.dart';
import '../../../common_components/profile_picture_widget.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class OrganizationEditProfilePage extends StatefulWidget {
  const OrganizationEditProfilePage({Key? key}) : super(key: key);

  @override
  State<OrganizationEditProfilePage> createState() =>
      _OrganizationEditProfilePageState();
}

class _OrganizationEditProfilePageState
    extends State<OrganizationEditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _localNameTEC = TextEditingController();
  final TextEditingController _foreignNameTEC = TextEditingController();
  final TextEditingController _addressTEC = TextEditingController();
  final TextEditingController _aboutTEC = TextEditingController();
  final TextEditingController _fieldOfWorkTEC = TextEditingController();
  final TextEditingController _visionTEC = TextEditingController();
  final TextEditingController _missionTEC = TextEditingController();

  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;
  SavedFileDto? _currentPicture;

  bool _editing = false;

  @override
  void initState() {
    super.initState();

    final getOrganizationProgramsCubit =
        BlocProvider.of<GetOrganizationProgramsCubit>(context);
    if (getOrganizationProgramsCubit.state is! GetOrganizationProgramsSuccess &&
        getOrganizationProgramsCubit.state is! GetOrganizationProgramsLoading) {
      getOrganizationProgramsCubit.getOrganizationPrograms(organizationId: globalAppStorage.getOrganizationAccount()?.id ?? 0);
    }
  }

  void setForEditing() {
    final organizationDto = globalAppStorage.getOrganizationAccount();
    _currentPicture = organizationDto?.profilePicture;

    _localNameTEC.text = organizationDto?.orgNameLocal ?? '';
    _foreignNameTEC.text = organizationDto?.orgNameForeign ?? '';
    _aboutTEC.text = organizationDto?.about ?? '';
    _fieldOfWorkTEC.text = organizationDto?.fieldOfWork ?? '';
    _addressTEC.text = organizationDto?.address ?? '';
    _visionTEC.text = organizationDto?.vision ?? '';
    _missionTEC.text = organizationDto?.mission ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final organizationDto = globalAppStorage.getOrganizationAccount();

    return Scaffold(
        appBar: AppBar(
          title: const Text('الملف التعريفي'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _editing = !_editing;
                    if (_editing) {
                      setForEditing();
                    }
                  });
                },
                icon: Icon(_editing ? Icons.edit_off : Icons.edit))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: !_editing
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ProfilePictureWidget(
                              imageRadius: 55,
                              iconRadius: 50,
                              iconSize: 50,
                              savedFileDto: organizationDto?.profilePicture),
                          addHorizontalSize(15),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    organizationDto?.fullName ?? '-',
                                    style: const TextStyle(
                                      fontSize: 21,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    organizationDto?.email ?? '-',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      DetailsItem(
                        title: 'مجال العمل:',
                        details: organizationDto?.fieldOfWork ?? '-',
                      ),
                      DetailsItem(
                        title: 'نبذة عن الشركة:',
                        details: organizationDto?.about ?? '-',
                      ),
                      DetailsItem(
                        title: 'العنوان:',
                        details: organizationDto?.address ?? '-',
                      ),
                      DetailsItem(
                        title: 'رقم الهاتف:',
                        details: organizationDto?.phoneNumber ?? '-',
                      ),
                      DetailsItem(
                        title: 'الرؤية:',
                        details: organizationDto?.vision ?? '-',
                      ),
                      DetailsItem(
                        title: 'الرسالة:',
                        details: organizationDto?.mission ?? '-',
                      ),
                      const Divider(),
                      addVerticalSize(20),
                      TitleWithAction(
                        title: 'برامج المؤسسة',
                        action: '',
                        icon: Icons.refresh,
                        onIconPressed: () {
                          BlocProvider.of<GetOrganizationProgramsCubit>(context)
                              .getOrganizationPrograms(organizationId: globalAppStorage.getOrganizationAccount()?.id ?? 0);
                        },
                      ),
                      addVerticalSize(10),
                      BlocConsumer<GetOrganizationProgramsCubit,
                          GetOrganizationProgramsState>(
                        listener: (context, state) {
                          if (state is GetOrganizationProgramsError) {
                            showNetworkException(
                                context: context, error: state.error);
                          }
                        },
                        builder: (context, state) {
                          if (state is GetOrganizationProgramsLoading) {
                            return const CenteredProgressIndicator(
                                verticalPadding: 30);
                          }
                          if (state is GetOrganizationProgramsError) {
                            return const CenteredErrorMessage(
                              verticalPadding: 30,
                            );
                          }
                          if (state is GetOrganizationProgramsSuccess) {
                            return ListView.builder(
                                itemCount: state.data.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: OrgProgramItemCard(
                                        item: state.data[index]),
                                  );
                                });
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  )
                : BlocListener<UpdateOrganizationProfileCubit,
                    UpdateOrganizationProfileState>(
                    listener: (context, state) {
                      if (state is UpdateOrganizationProfileError) {
                        showNetworkException(
                            context: context, error: state.error);
                      }

                      if (state is UpdateOrganizationProfileSuccess) {
                        globalAppStorage.setOrganizationAccount(state.data);
                        setState(() {
                          _editing = false;
                        });

                        showSuccessSnackBar(
                            context: context,
                            message: 'تم تعديل بيانات المؤسسة بنجاح');
                      }
                    },
                    child: Column(
                      children: [
                        addVerticalSize(10),
                        InkWell(
                          borderRadius: BorderRadius.circular(5),
                          onTap: () async {
                            final image = await pickImage();
                            if (image != null) {
                              if (mounted) {
                                final tempFile =
                                    await showUploadFile(context, image);
                                if (tempFile != null) {
                                  setState(() {
                                    _uploadedImageTempFile = tempFile;
                                    _selectedImage = image;
                                  });
                                }
                              }
                            }
                          },
                          child: _selectedImage != null
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Image.file(_selectedImage!,
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _selectedImage = null;
                                              _uploadedImageTempFile = null;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Colors.white,
                                            size: 28,
                                          )),
                                    ],
                                  ),
                                )
                              : _currentPicture != null
                                  ? Stack(
                                      children: [
                                        ProfilePictureWidget(
                                          savedFileDto: _currentPicture,
                                          isRectangleImage: true,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _currentPicture = null;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.clear,
                                              color: Colors.white,
                                              size: 28,
                                            )),
                                      ],
                                    )
                                  : Card(
                                      color: Colors.grey.shade100,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: const Center(
                                            child: Icon(Icons.add, size: 40)),
                                      ),
                                    ),
                        ),
                        addVerticalSize(10),
                        if (_selectedImage == null && _currentPicture == null)
                          const Text('اختيار صورة شخصية'),
                        addVerticalSize(15),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addVerticalSize(8),
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'معلومات المؤسسة/الشركة',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              TextFormField(
                                controller: _localNameTEC,
                                validator: fieldRequiredValidator,
                                decoration: const InputDecoration(
                                  labelText:
                                      'اسم المؤسسة/الشركة باللغة العربية *',
                                ),
                              ),
                              addVerticalSize(10),
                              TextFormField(
                                controller: _foreignNameTEC,
                                decoration: const InputDecoration(
                                  labelText:
                                      'اسم المؤسسة/الشركة باللغة الإنجليزية',
                                ),
                              ),
                              addVerticalSize(10),
                              TextFormField(
                                controller: _fieldOfWorkTEC,
                                validator: fieldRequiredValidator,
                                decoration: const InputDecoration(
                                  labelText: 'مجال العمل *',
                                ),
                              ),
                              addVerticalSize(10),
                              TextFormField(
                                controller: _aboutTEC,
                                validator: fieldRequiredValidator,
                                maxLines: 5,
                                minLines: 3,
                                decoration: const InputDecoration(
                                  labelText: 'نبذة عن الشركة/المؤسسة *',
                                ),
                              ),
                              addVerticalSize(20),
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'معلومات إضافية (اختياري)',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              TextFormField(
                                controller: _addressTEC,
                                decoration: const InputDecoration(
                                  labelText: 'العنوان',
                                ),
                              ),
                              addVerticalSize(10),
                              addVerticalSize(10),
                              TextFormField(
                                controller: _visionTEC,
                                decoration: const InputDecoration(
                                  labelText: 'الرؤية',
                                ),
                              ),
                              addVerticalSize(10),
                              TextFormField(
                                controller: _missionTEC,
                                decoration: const InputDecoration(
                                  labelText: 'الرسالة',
                                ),
                              ),
                            ],
                          ),
                        ),
                        addVerticalSize(10),
                        addVerticalSize(15),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              BlocProvider.of<UpdateOrganizationProfileCubit>(
                                      context)
                                  .updateOrganization(UpdateOrganizationDto(
                                id: organizationDto?.id ?? 0,
                                orgNameLocal: _localNameTEC.text,
                                orgNameForeign: _foreignNameTEC.text,
                                fieldOfWork: _fieldOfWorkTEC.text,
                                about: _aboutTEC.text,
                                vision: _visionTEC.text,
                                mission: _missionTEC.text,
                                address: _addressTEC.text,
                                saveTempFile: _uploadedImageTempFile != null
                                    ? SaveTempFile(
                                        tempFileId: _uploadedImageTempFile!.id!)
                                    : null,
                              ));
                            }
                          },
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: const Center(child: Text('حفظ المعلومات')),
                          ),
                        ),
                        BlocBuilder<UpdateOrganizationProfileCubit,
                            UpdateOrganizationProfileState>(
                          builder: (context, state) {
                            if (state is UpdateOrganizationProfileLoading) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: CircularProgressIndicator(),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        addVerticalSize(50),
                      ],
                    ),
                  ),
          ),
        ));
  }
}
