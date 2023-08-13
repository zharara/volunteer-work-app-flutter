import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/volunteer_opportunities/create_opportunity/create_opportunity_cubit.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/ui/common_components/bottom_sheet_app_bar.dart';
import 'package:volunteer_work_app/ui/common_components/centered_progress_indicator.dart';
import 'package:volunteer_work_app/ui/common_components/snack_bars.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';
import 'package:volunteer_work_app/utils/pick_images.dart';

import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/static_data.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/select_category_input.dart';
import '../../../common_components/select_skills_input.dart';
import '../../../common_components/show_upload_files.dart';

class CreateVolunteerOpportunityPage extends StatefulWidget {
  const CreateVolunteerOpportunityPage({Key? key}) : super(key: key);

  @override
  State<CreateVolunteerOpportunityPage> createState() =>
      _CreateVolunteerOpportunityPageState();
}

class _CreateVolunteerOpportunityPageState
    extends State<CreateVolunteerOpportunityPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _descriptionTEC = TextEditingController();
  final TextEditingController _natureOfWorkOrActivitiesTEC =
      TextEditingController();
  final TextEditingController _categoryTEC = TextEditingController();
  final TextEditingController _requiredVolunteerStudentsNumberTEC =
      TextEditingController();
  final TextEditingController _startDateTEC = TextEditingController();
  final TextEditingController _endDateTEC = TextEditingController();
  final TextEditingController _stopReceiveDateTEC = TextEditingController();
  final TextEditingController _announcementEndDateTEC = TextEditingController();
  final TextEditingController _applicantQualificationsTEC =
      TextEditingController();
  final TextEditingController _fileTypesTEC = TextEditingController();
  final TextEditingController _fileDescTEC = TextEditingController();
  final TextEditingController _fileMaxSizeTEC = TextEditingController();

  final TextEditingController _skillsListTEC = TextEditingController();

  CategoryDto? _selectedCategory;
  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  DateTime? _selectedStopReceiveApplicationsDate;
  DateTime? _selectedAnnouncementEndDate;

  bool _isRequirementNeededAsText = false;
  bool _isRequirementNeededAsFile = false;

  String? _selectedFileTypes;

  List<ExistingOrCreateNewSkillDto> _skills = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOpportunityCubit, CreateOpportunityState>(
      listener: (context, state) {
        if (state is CreateOpportunityError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is CreateOpportunitySuccess) {
          _formKey.currentState?.reset();
          _titleTEC.clear();
          _descriptionTEC.clear();
          _categoryTEC.clear();
          _natureOfWorkOrActivitiesTEC.clear();
          _startDateTEC.clear();
          _endDateTEC.clear();
          _stopReceiveDateTEC.clear();
          _announcementEndDateTEC.clear();
          _skillsListTEC.clear();
          _fileTypesTEC.clear();
          _fileDescTEC.clear();
          _fileMaxSizeTEC.clear();
          _applicantQualificationsTEC.clear();
          _requiredVolunteerStudentsNumberTEC.clear();

          setState(() {
            _selectedCategory = null;
            _selectedStartDate = null;
            _selectedEndDate = null;
            _selectedImage = null;
            _uploadedImageTempFile = null;
            _skills = [];
            _isRequirementNeededAsText = false;
            _isRequirementNeededAsFile = false;
          });

          showSuccessSnackBar(
              context: context, message: 'تم إنشاء فرصة التطوع بنجاح');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء فرصة تطوع جديدة'),
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
                      addVerticalSize(10),
                      if (_selectedImage == null)
                        const Text('اختيار صورة شعار'),
                      addVerticalSize(15),
                      TextFormField(
                        controller: _titleTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'عنوان الفرصة *',
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
                        controller: _natureOfWorkOrActivitiesTEC,
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText: 'طبيعة العمل أو الأنشطة *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _requiredVolunteerStudentsNumberTEC,
                        validator: fieldRequiredValidator,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'العدد الأقصى للطلبة المتقدمين *',
                        ),
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
                          labelText: 'التاريخ المحدد لبدء البرنامج *',
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
                          labelText: 'التاريخ المتوقع لانتهاء البرنامج *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _stopReceiveDateTEC,
                        readOnly: true,
                        onTap: () async {
                          final now = DateTime.now();
                          _selectedStopReceiveApplicationsDate =
                              await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(now.year),
                            lastDate: now.add(const Duration(days: 500)),
                          );

                          if ((_selectedStopReceiveApplicationsDate) != null) {
                            _stopReceiveDateTEC.text =
                                _selectedStopReceiveApplicationsDate!
                                    .getDateString();
                          }
                        },
                        validator: fieldRequiredValidator,
                        decoration: const InputDecoration(
                          labelText:
                              'التاريخ المحدد للتوقف عن استقبال الطلبات *',
                        ),
                      ),
                      addVerticalSize(10),
                      TextFormField(
                        controller: _announcementEndDateTEC,
                        readOnly: true,
                        onTap: () async {
                          final now = DateTime.now();
                          _selectedAnnouncementEndDate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: DateTime(now.year),
                            lastDate: now.add(const Duration(days: 500)),
                          );

                          if ((_selectedAnnouncementEndDate) != null) {
                            _announcementEndDateTEC.text =
                                _selectedAnnouncementEndDate!.getDateString();
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'التاريخ المحدد لانتهاء إعلان الفرصة',
                        ),
                      ),
                      addVerticalSize(10),
                      SelectSkillsInput(
                        isRequired: false,
                        label: 'مهارات التطوع المقترحة',
                        textEditingController: _skillsListTEC,
                        onSelect: (selectedSkills) {
                          _skills = selectedSkills;
                        },
                      ),
                      addVerticalSize(10),
                      CheckboxListTile(
                          value: _isRequirementNeededAsText,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('متطلبات التقدم على شكل نص كتابي؟'),
                          onChanged: (selected) {
                            setState(() {
                              _isRequirementNeededAsText = selected ?? false;
                            });
                          }),
                      if (_isRequirementNeededAsText) addVerticalSize(10),
                      if (_isRequirementNeededAsText)
                        TextFormField(
                          controller: _applicantQualificationsTEC,
                          validator: fieldRequiredValidator,
                          maxLines: 5,
                          minLines: 3,
                          decoration: const InputDecoration(
                            labelText: 'ماذا ينبغي أن تكون مؤهلات المتقدم؟',
                          ),
                        ),
                      addVerticalSize(10),
                      CheckboxListTile(
                          value: _isRequirementNeededAsFile,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text('متطلبات التقدم على شكل ملف؟'),
                          onChanged: (selected) {
                            setState(() {
                              _isRequirementNeededAsFile = selected ?? false;
                            });
                          }),
                      if (_isRequirementNeededAsFile) ...[
                        addVerticalSize(10),
                        TextFormField(
                          controller: _fileDescTEC,
                          validator: fieldRequiredValidator,
                          decoration: const InputDecoration(
                            labelText: 'وصف الملف المطلوب',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _fileMaxSizeTEC,
                          validator: fieldRequiredValidator,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'الحد الأقصى لحجم الملف (ميغابايت)',
                          ),
                        ),
                        addVerticalSize(10),
                        TextFormField(
                          controller: _fileTypesTEC,
                          validator: fieldRequiredValidator,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'أنواع الملفات المسموحة',
                          ),
                          onTap: () async {
                            Map<String, String> toSelectFileTypes = {};

                            final types = await showModalBottomSheet<
                                    Map<String, String>>(
                                context: context,
                                builder: (ctx) {
                                  return StatefulBuilder(
                                      builder: (ctx, sSetState) {
                                    return Scaffold(
                                      appBar: const BottomSheetAppBar(
                                        title: 'اختيار أنواع الملفات المسموحة',
                                      ),
                                      body: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: fileTypes.length,
                                              itemBuilder: (ctx, index) =>
                                                  CheckboxListTile(
                                                value: toSelectFileTypes
                                                    .containsKey(fileTypes.keys
                                                        .elementAt(index)),
                                                title: Text(fileTypes.keys
                                                    .elementAt(index)),
                                                onChanged: (selected) {
                                                  sSetState(() {
                                                    if (selected ?? false) {
                                                      toSelectFileTypes
                                                          .addEntries([
                                                        fileTypes.entries
                                                            .elementAt(index)
                                                      ]);
                                                    } else {
                                                      toSelectFileTypes
                                                          .removeWhere((k, v) =>
                                                              k ==
                                                              fileTypes.keys
                                                                  .elementAt(
                                                                      index));
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context,
                                                        toSelectFileTypes);
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

                            if (types?.isNotEmpty ?? false) {
                              _selectedFileTypes = types?.values.join(",");
                              _fileTypesTEC.text = types!.keys.toString();
                            }
                          },
                        ),
                      ],
                      addVerticalSize(10),
                    ],
                  ),
                ),
                addVerticalSize(10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        BlocProvider.of<CreateOpportunityCubit>(context)
                            .createOpportunity(
                          CreateVolunteerOpportunityDto(
                            organizationId:
                                globalAppStorage.getOrganizationAccount()?.id ??
                                    0,
                            title: _titleTEC.text,
                            saveTempFile: _uploadedImageTempFile != null
                                ? SaveTempFile(
                                    tempFileId: _uploadedImageTempFile!.id!)
                                : null,
                            description: _descriptionTEC.text,
                            natureOfWorkOrActivities:
                                _natureOfWorkOrActivitiesTEC.text,
                            actualProgramStartDate: _selectedStartDate!,
                            actualProgramEndDate: _selectedEndDate!,
                            receiveApplicationsEndDate:
                                _selectedStopReceiveApplicationsDate!,
                            announcementEndDate: _selectedAnnouncementEndDate,
                            requiredVolunteerStudentsNumber: int.tryParse(
                                _requiredVolunteerStudentsNumberTEC.text) ?? 0,
                            isRequirementNeededAsText:
                                _isRequirementNeededAsText,
                            applicantQualifications:
                                _applicantQualificationsTEC.text,
                            isRequirementNeededAsFile:
                                _isRequirementNeededAsFile,
                            categoryId: _selectedCategory?.id,
                            volunteerSkills: _skills,
                            requirementFileAllowedTypes: _selectedFileTypes,
                            requirementFileDescription: _fileDescTEC.text,
                            requirementFileMaxAllowedSize:
                                double.tryParse(_fileMaxSizeTEC.text),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(child: Text('إنشاء فرصة تطوع')),
                    ),
                  ),
                ),
                BlocBuilder<CreateOpportunityCubit, CreateOpportunityState>(
                  builder: (context, state) {
                    if (state is CreateOpportunityLoading) {
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
