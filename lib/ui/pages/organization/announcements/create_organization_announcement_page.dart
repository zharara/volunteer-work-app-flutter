import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/volunteer_programs/get_organization_programs/get_organization_programs_cubit.dart';

import '../../../../blocs/announcements/create_organization_announcement/create_organization_announcement_cubit.dart';
import '../../../../blocs/announcements/get_management_announcements/get_management_announcements_cubit.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/bottom_sheet_app_bar.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class CreateOrganizationAnnouncementPage extends StatefulWidget {
  const CreateOrganizationAnnouncementPage({Key? key}) : super(key: key);

  @override
  State<CreateOrganizationAnnouncementPage> createState() =>
      _CreateOrganizationAnnouncementPageState();
}

class _CreateOrganizationAnnouncementPageState
    extends State<CreateOrganizationAnnouncementPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _descriptionTEC = TextEditingController();
  final TextEditingController _programTEC = TextEditingController();

  VolunteerProgramDto? _selectedProgram;
  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrganizationAnnouncementCubit,
        CreateOrganizationAnnouncementState>(
      listener: (context, state) {
        if (state is CreateOrganizationAnnouncementError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is CreateOrganizationAnnouncementSuccess) {
          _formKey.currentState?.reset();
          _titleTEC.clear();
          _descriptionTEC.clear();

          _selectedImage = null;
          _uploadedImageTempFile = null;

          showSuccessSnackBar(
              context: context, message: 'تم إنشاء إعلان المؤسسة بنجاح');
          context
              .read<GetManagementAnnouncementsCubit>()
              .getManagementAnnouncements();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء إعلان مؤسسة جديد'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(
                  title: 'أدخل المعلومات المطلوبة',
                ),
                Form(
                  key: _formKey,
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
                                  width:
                                  MediaQuery
                                      .of(context)
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
                            : Card(
                          color: Colors.grey.shade100,
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 3,
                            height: MediaQuery
                                .of(context)
                                .size
                                .width / 3,
                            child: const Center(
                                child: Icon(Icons.add, size: 40)),
                          ),
                        ),
                      ),
                      addVerticalSize(10),
                      if (_selectedImage == null)
                        const Text('اختيار صورة للإعلان'),
                      addVerticalSize(15),
                      TextFormField(
                        controller: _titleTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'عنوان الإعلان *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _descriptionTEC,
                        validator: fieldRequiredValidator,
                        maxLines: 5,
                        minLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'الوصف *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        readOnly: true,
                        onTap: () {
                          if (BlocProvider
                              .of<
                              GetOrganizationProgramsCubit>(context)
                              .state is! GetOrganizationProgramsSuccess) {
                            BlocProvider.of<GetOrganizationProgramsCubit>(
                                context)
                                .getOrganizationPrograms(organizationId:
                            globalAppStorage
                                .getOrganizationAccount()
                                ?.id ?? 0,);
                          }

                          showModalBottomSheet(
                              context: context,
                              builder: (ctx) {
                                VolunteerProgramDto? toSelectProgram;

                                return StatefulBuilder(
                                    builder: (ctx, sSetState) {
                                      return Scaffold(
                                        backgroundColor: Colors.white,
                                        appBar: BottomSheetAppBar(
                                          title: 'اختيار برنامج التطوع',
                                          actions: [
                                            IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                      GetOrganizationProgramsCubit>(
                                                      context)
                                                      .getOrganizationPrograms(
                                                      organizationId:
                                                      globalAppStorage
                                                          .getOrganizationAccount()
                                                          ?.id ?? 0);
                                                },
                                                icon: const Icon(Icons.refresh))
                                          ],
                                        ),
                                        body: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: BlocConsumer<
                                                  GetOrganizationProgramsCubit,
                                                  GetOrganizationProgramsState>(
                                                listener: (context, state) {
                                                  if (state
                                                  is GetOrganizationProgramsError) {}
                                                },
                                                builder: (context, state) {
                                                  if (state
                                                  is GetOrganizationProgramsLoading) {
                                                    return const CenteredProgressIndicator(
                                                        verticalPadding: 0);
                                                  }
                                                  if (state
                                                  is GetOrganizationProgramsError) {
                                                    return const CenteredErrorMessage(
                                                        verticalPadding: 0);
                                                  }
                                                  if (state
                                                  is GetOrganizationProgramsEmpty) {
                                                    return const CenteredEmptyData();
                                                  }
                                                  if (state
                                                  is GetOrganizationProgramsSuccess) {
                                                    return ListView.builder(
                                                        itemCount:
                                                        state.data.length,
                                                        itemBuilder: (ctx,
                                                            index) {
                                                          final item =
                                                          state.data[index];

                                                          return RadioListTile<
                                                              VolunteerProgramDto>(
                                                            value: item,
                                                            title: Text(state
                                                                .data[index]
                                                                .title ??
                                                                '-'),
                                                            subtitle: Text(state
                                                                .data[index]
                                                                .description ??
                                                                '-'),
                                                            groupValue:
                                                            toSelectProgram,
                                                            onChanged: (
                                                                selected) {
                                                              sSetState(() {
                                                                toSelectProgram =
                                                                    selected;
                                                              });
                                                            },
                                                          );
                                                        });
                                                  }

                                                  return const SizedBox
                                                      .shrink();
                                                },
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: [
                                                TextButton(
                                                    onPressed:
                                                    toSelectProgram == null
                                                        ? null
                                                        : () {
                                                      _programTEC
                                                          .text =
                                                          toSelectProgram
                                                              ?.title ??
                                                              '';

                                                      _selectedProgram =
                                                          toSelectProgram;

                                                      Navigator.pop(
                                                          context);
                                                    },
                                                    child: const Text(
                                                        'اختيار')),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'رجوع',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              });
                        },
                        controller: _programTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'اختيار برنامج التطوع',
                        ),
                      ),
                      addVerticalSize(10),
                    ],
                  ),
                ),
                addVerticalSize(10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        BlocProvider.of<CreateOrganizationAnnouncementCubit>(
                            context)
                            .createOrganizationAnnouncement(
                          title: _titleTEC.text,
                          description: _descriptionTEC.text,
                          saveTempFile: _uploadedImageTempFile != null
                              ? SaveTempFile(
                              tempFileId: _uploadedImageTempFile!.id!)
                              : null,
                          volunteerProgramId: _selectedProgram?.id ?? 0,
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(child: Text('إنشاء إعلان مؤسسة')),
                    ),
                  ),
                ),
                BlocBuilder<CreateOrganizationAnnouncementCubit,
                    CreateOrganizationAnnouncementState>(
                  builder: (context, state) {
                    if (state is CreateOrganizationAnnouncementLoading) {
                      return const CenteredProgressIndicator(
                          verticalPadding: 20);
                    }
                    return const SizedBox.shrink();
                  },
                ),
                addVerticalSize(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
