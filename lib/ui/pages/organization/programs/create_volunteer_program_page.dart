import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/student_applications/get_applications_for_opportunity/get_applications_for_opportunity_cubit.dart';
import 'package:volunteer_work_app/blocs/volunteer_opportunities/get_organization_opportunities/get_organization_opportunities_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.enums.swagger.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/volunteer_programs/create_program/create_program_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/application_status_chip.dart';
import '../../../common_components/bottom_sheet_app_bar.dart';
import '../../../common_components/centered_empty_data.dart';
import '../../../common_components/centered_error_message.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/select_category_input.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';
import '../applications/organization_view_application_details_page.dart';

class CreateVolunteerProgramPage extends StatefulWidget {
  const CreateVolunteerProgramPage({Key? key}) : super(key: key);

  @override
  State<CreateVolunteerProgramPage> createState() =>
      _CreateVolunteerProgramPageState();
}

class _CreateVolunteerProgramPageState
    extends State<CreateVolunteerProgramPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _descriptionTEC = TextEditingController();

  final TextEditingController _categoryTEC = TextEditingController();
  final TextEditingController _opportunityTEC = TextEditingController();

  final TextEditingController _startDateTEC = TextEditingController();
  final TextEditingController _endDateTEC = TextEditingController();

  CategoryDto? _selectedCategory;
  VolunteerOpportunityDto? _selectedOpportunity;
  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateProgramCubit, CreateProgramState>(
      listener: (context, state) {
        if (state is CreateProgramError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is CreateProgramSuccess) {
          _formKey.currentState?.reset();
          _titleTEC.clear();
          _descriptionTEC.clear();
          _categoryTEC.clear();
          _opportunityTEC.clear();
          _startDateTEC.clear();
          _endDateTEC.clear();
          _selectedCategory = null;
          _selectedOpportunity = null;
          _selectedStartDate = null;
          _selectedEndDate = null;
          _selectedImage = null;
          _uploadedImageTempFile = null;

          showSuccessSnackBar(
              context: context, message: 'تم إنشاء برنامج التطوع بنجاح');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء برنامج تطوع جديد'),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSize(10),
                      Center(
                        child: InkWell(
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
                                              MediaQuery.of(context).size.width /
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
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: MediaQuery.of(context).size.width / 3,
                                    child: const Center(
                                        child: Icon(Icons.add, size: 40)),
                                  ),
                                ),
                        ),
                      ),
                      addVerticalSize(10),
                      if (_selectedImage == null)
                        const Center(child: Text('اختيار صورة شعار')),
                      addVerticalSize(15),
                      TextFormField(
                        controller: _titleTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'عنوان البرنامج *',
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
                      SelectCategoryInput(
                        currentlySelected: _selectedCategory,
                        textEditingController: _categoryTEC,
                        onSelect: (CategoryDto? selectedCategory) {
                          _selectedCategory = selectedCategory;
                        },
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _startDateTEC,
                        readOnly: true,
                        onTap: () async {
                          final now = DateTime.now();
                          _selectedStartDate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(now.year),
                            lastDate: now.add(const Duration(days: 500)),
                          );

                          if (_selectedStartDate != null) {
                            _startDateTEC.text =
                                _selectedStartDate!.getDateString();
                          }
                        },
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'تاريخ بدء البرنامج *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _endDateTEC,
                        readOnly: true,
                        onTap: () async {
                          final now = DateTime.now();
                          _selectedEndDate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(now.year),
                            lastDate: now.add(const Duration(days: 500)),
                          );

                          if (_selectedEndDate != null) {
                            _endDateTEC.text =
                                _selectedEndDate!.getDateString();
                          }
                        },
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'تاريخ انتهاء البرنامج *',
                        ),
                      ),
                      addVerticalSize(10),
                      const Text(
                        'ملاحظة: إذا تم اختيار فرصة التطوع الآن فإن النظام سيقوم بربط الطلبة المقبولين بهذا البرنامج تلقائياً. ولكن إذا لم يتم اختيار الفرصة فإن الإدارة وحدها بإمكانها تسجيل المتطوعين بهذا البرنامج لاحقاً.',
                        style: TextStyle(fontSize: 17),
                      ),
                      addVerticalSize(16),
                      TextFormField(
                        readOnly: true,
                        onTap: () {
                          if (BlocProvider.of<
                                  GetOrganizationOpportunitiesCubit>(context)
                              .state is! GetOrganizationOpportunitiesSuccess) {
                            BlocProvider.of<GetOrganizationOpportunitiesCubit>(
                                    context)
                                .getOrganizationOpportunities(globalAppStorage
                                        .getOrganizationAccount()
                                        ?.id ??
                                    0);
                          }

                          showModalBottomSheet(
                              context: context,
                              builder: (ctx) {
                                VolunteerOpportunityDto? toSelectOpportunity;

                                return StatefulBuilder(
                                    builder: (ctx, sSetState) {
                                  return Scaffold(
                                    backgroundColor: Colors.white,
                                    appBar: BottomSheetAppBar(
                                      title: 'اختيار فرصة التطوع المرتبطة',
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              BlocProvider.of<
                                                          GetOrganizationOpportunitiesCubit>(
                                                      context)
                                                  .getOrganizationOpportunities(
                                                      globalAppStorage
                                                              .getOrganizationAccount()
                                                              ?.id ??
                                                          0);
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
                                              GetOrganizationOpportunitiesCubit,
                                              GetOrganizationOpportunitiesState>(
                                            listener: (context, state) {
                                              if (state
                                                  is GetOrganizationOpportunitiesError) {}
                                            },
                                            builder: (context, state) {
                                              if (state
                                                  is GetOrganizationOpportunitiesLoading) {
                                                return const CenteredProgressIndicator(
                                                    verticalPadding: 0);
                                              }
                                              if (state
                                                  is GetOrganizationOpportunitiesError) {
                                                return const CenteredErrorMessage(
                                                    verticalPadding: 0);
                                              }
                                              if (state
                                                  is GetOrganizationOpportunitiesEmpty) {
                                                return const CenteredEmptyData();
                                              }
                                              if (state
                                                  is GetOrganizationOpportunitiesSuccess) {
                                                return ListView.builder(
                                                    itemCount:
                                                        state.data.length,
                                                    itemBuilder: (ctx, index) {
                                                      final item =
                                                          state.data[index];

                                                      return RadioListTile<
                                                          VolunteerOpportunityDto>(
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
                                                            toSelectOpportunity,
                                                        onChanged: (selected) {
                                                          sSetState(() {
                                                            toSelectOpportunity =
                                                                selected;
                                                          });
                                                        },
                                                      );
                                                    });
                                              }

                                              return const SizedBox.shrink();
                                            },
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                                onPressed:
                                                    toSelectOpportunity == null
                                                        ? null
                                                        : () {
                                                            setState(() {
                                                              _selectedOpportunity =
                                                                  toSelectOpportunity;
                                                            });

                                                            _opportunityTEC
                                                                    .text =
                                                                toSelectOpportunity
                                                                        ?.title ??
                                                                    '';

                                                            BlocProvider.of<
                                                                        GetApplicationsForOpportunityCubit>(
                                                                    context)
                                                                .getApplicationsForOpportunity(
                                                              opportunityId:
                                                                  toSelectOpportunity!
                                                                      .id!,
                                                            );

                                                            Navigator.pop(
                                                                context);
                                                          },
                                                child: const Text('اختيار')),
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
                        controller: _opportunityTEC,
                        decoration: const InputDecoration(
                          labelText: 'فرصة التطوع المرتبطة',
                        ),
                      ),
                      if (_selectedOpportunity != null) ...[
                        addVerticalSize(15),
                        const Text(
                          'الطلبة الذين قبلتهم الإدارة في فرصة التطوع: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        addVerticalSize(10),
                        BlocConsumer<GetApplicationsForOpportunityCubit,
                            GetApplicationsForOpportunityState>(
                          listener: (context, state) {
                            if (state is GetApplicationsForOpportunityError) {
                              showNetworkException(
                                  context: context, error: state.error);
                            }
                          },
                          builder: (context, state) {
                            if (state is GetApplicationsForOpportunityLoading) {
                              return const CenteredProgressIndicator(
                                  verticalPadding: 0);
                            }
                            if (state is GetApplicationsForOpportunityError) {
                              return const CenteredErrorMessage(
                                  verticalPadding: 0);
                            }
                            if (state is GetApplicationsForOpportunityEmpty) {
                              return const CenteredEmptyData();
                            }
                            if (state is GetApplicationsForOpportunitySuccess) {
                              final data = state.data
                                  .where((e) =>
                                      e.statusForManagement ==
                                      ApplicationStatus.approved)
                                  .toList();

                              return  ListView.builder(
                                    itemCount: data.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (ctx, index) {
                                      final item = data[index];
                                      return Card(
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 8),
                                          leading:
                                              item.student?.profilePicture == null
                                                  ? null
                                                  : CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          '$kDownloadFilesURL/${item.student?.profilePicture?.fileKey ?? ''}',
                                                          headers: {
                                                            'Authorization':
                                                                globalAppStorage
                                                                    .getAccessToken()
                                                          }),
                                                    ),
                                          title:
                                              Text(item.student?.fullName ?? '-'),
                                          isThreeLine: true,
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(item.volunteerOpportunity
                                                      ?.title ??
                                                  '-'),
                                              addVerticalSize(5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text('الإدارة: '),
                                                      ApplicationStatusChip(
                                                          status: item
                                                              .statusForManagement)
                                                    ],
                                                  ),
                                                  addHorizontalSize(4),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text('المؤسسة: '),
                                                      ApplicationStatusChip(
                                                          status: item
                                                              .statusForManagement)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          trailing: IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          OrganizationViewApplicationDetailsPage(
                                                            applicationDto: item,
                                                          )),
                                                );
                                              },
                                              icon: const Icon(
                                                  Icons.arrow_forward)),
                                        ),
                                      );
                                    })
                              ;
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ]
                    ],
                  ),
                ),
                addVerticalSize(20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        BlocProvider.of<CreateProgramCubit>(context)
                            .createProgram(
                          CreateVolunteerProgramDto(
                            organizationId:
                                globalAppStorage.getOrganizationAccount()?.id ??
                                    0,
                            volunteerOpportunityId: _selectedOpportunity?.id,
                            title: _titleTEC.text,
                            saveTempFile: _uploadedImageTempFile != null
                                ? SaveTempFile(
                                    tempFileId: _uploadedImageTempFile!.id!)
                                : null,
                            description: _descriptionTEC.text,
                            startDate: _selectedStartDate!,
                            endDate: _selectedEndDate!,
                            categoryId: _selectedCategory?.id,
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(child: Text('إنشاء برنامج تطوع')),
                    ),
                  ),
                ),
                BlocBuilder<CreateProgramCubit, CreateProgramState>(
                  builder: (context, state) {
                    if (state is CreateProgramLoading) {
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
