import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/volunteer_opportunities/update_opportunity/update_opportunity_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../../utils/static_data.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/bottom_sheet_app_bar.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/details_item.dart';
import '../../../common_components/select_category_input.dart';
import '../../../common_components/select_skills_input.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class OpportunityEditPage extends StatefulWidget {
  const OpportunityEditPage({Key? key, required this.opportunity})
      : super(key: key);

  final VolunteerOpportunityDto opportunity;

  @override
  State<OpportunityEditPage> createState() => _OpportunityEditPageState();
}

class _OpportunityEditPageState extends State<OpportunityEditPage> {
  late VolunteerOpportunityDto _opportunity;

  bool _editing = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _descriptionTEC = TextEditingController();
  final TextEditingController _natureOfWorkOrActivitiesTEC =
      TextEditingController();
  final TextEditingController _requiredVolunteerStudentsNumberTEC =
      TextEditingController();
  final TextEditingController _applicantQualificationsTEC =
      TextEditingController();
  final TextEditingController _fileTypesTEC = TextEditingController();
  final TextEditingController _fileDescTEC = TextEditingController();
  final TextEditingController _fileMaxSizeTEC = TextEditingController();

  final TextEditingController _categoryTEC = TextEditingController();

  final TextEditingController _startDateTEC = TextEditingController();
  final TextEditingController _endDateTEC = TextEditingController();
  final TextEditingController _stopReceiveDateTEC = TextEditingController();
  final TextEditingController _announcementEndDateTEC = TextEditingController();

  final TextEditingController _skillsListTEC = TextEditingController();

  CategoryDto? _selectedCategory;
  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;
  SavedFileDto? _currentLogo;

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  DateTime? _selectedStopReceiveApplicationsDate;
  DateTime? _selectedAnnouncementEndDate;

  bool _isRequirementNeededAsText = false;
  bool _isRequirementNeededAsFile = false;

  String? _selectedFileTypes;

  List<ExistingOrCreateNewSkillDto> _skills = [];

  @override
  void initState() {
    super.initState();

    _opportunity = widget.opportunity;
  }

  void setForEditing() {
    _titleTEC.text = _opportunity.title ?? '';
    _descriptionTEC.text = _opportunity.description ?? '';
    _natureOfWorkOrActivitiesTEC.text =
        _opportunity.natureOfWorkOrActivities ?? '';
    _requiredVolunteerStudentsNumberTEC.text =
        _opportunity.requiredVolunteerStudentsNumber?.toString() ?? '';
    _applicantQualificationsTEC.text =
        _opportunity.applicantQualifications ?? '';
    _fileTypesTEC.text = _opportunity.requirementFileAllowedTypes ?? '';
    _fileDescTEC.text = _opportunity.requirementFileDescription ?? '';
    _fileMaxSizeTEC.text = _opportunity.requirementFileMaxAllowedSize?.toString() ?? '';

    _categoryTEC.text = _opportunity.category?.name ?? '';
    _startDateTEC.text =
        _opportunity.actualProgramStartDate?.getDateString() ?? '';
    _endDateTEC.text = _opportunity.actualProgramEndDate?.getDateString() ?? '';
    _stopReceiveDateTEC.text =
        _opportunity.receiveApplicationsEndDate?.getDateString() ?? '';
    _announcementEndDateTEC.text =
        _opportunity.announcementEndDate?.getDateString() ?? '';

    _selectedCategory = _opportunity.category;
    _selectedStartDate = _opportunity.actualProgramStartDate;
    _selectedEndDate = _opportunity.actualProgramEndDate;
    _selectedStopReceiveApplicationsDate =
        _opportunity.receiveApplicationsEndDate;
    _selectedAnnouncementEndDate = _opportunity.announcementEndDate;

    _isRequirementNeededAsText =
        _opportunity.isRequirementNeededAsText ?? false;
    _isRequirementNeededAsFile =
        _opportunity.isRequirementNeededAsFile ?? false;

    _skillsListTEC.clear();
    for (final skill in _opportunity.volunteerSkills ?? []) {
      _skillsListTEC.text =
          '${_skillsListTEC.text.trim()} ${_skillsListTEC.text.trim().isEmpty ? '' : '-'} ${skill.name}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editing ? 'تعديل فرصة التطوع' : 'تفاصيل فرصة التطوع'),
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
            icon: Icon(_editing ? Icons.edit_off : Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: !_editing
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSize(20),
                    Row(
                      children: [
                        Container(
                          child: _opportunity.logo == null
                              ? const Icon(
                                  Icons.volunteer_activism_outlined,
                                  size: 40,
                                  color: Colors.indigoAccent,
                                )
                              : CachedNetworkImage(
                                  imageUrl:
                                      '$kDownloadFilesURL/${_opportunity.logo?.fileKey ?? ''}',
                                  httpHeaders: {
                                    'Authorization':
                                        'Bearer ${globalAppStorage.getAccessToken()}'
                                  },
                                  imageBuilder: (ctx, image) {
                                    return CircleAvatar(
                                        radius: 55, backgroundImage: image);
                                  },
                                  progressIndicatorBuilder:
                                      (ctx, url, downloadProgress) {
                                    return CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    );
                                  },
                                  errorWidget: (ctx, url, error) {
                                    return const Icon(
                                      Icons.error_outline,
                                      size: 40,
                                    );
                                  },
                                ),
                        ),
                        addHorizontalSize(15),
                        Flexible(
                          child: Text(
                            _opportunity.title ?? '-',
                            style: const TextStyle(fontSize: 21),
                          ),
                        ),

                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    addVerticalSize(10),
                    DetailsItem(
                      title: 'التصنيف/الفئة:',
                      details: _opportunity.category?.name ?? '-',
                    ),
                    DetailsItem(
                      title: 'الوصف:',
                      details: _opportunity.description ?? '-',
                    ),
                    DetailsItem(
                      title: 'طبيعة العمل والأنشطة:',
                      details: _opportunity.natureOfWorkOrActivities ?? '-',
                    ),
                    DetailsItem(
                      title: 'عدد المتطوعين المطلوب:',
                      details: _opportunity.requiredVolunteerStudentsNumber
                              ?.toString() ??
                          '-',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    DetailsItem(
                      title: 'تاريخ انتهاء إعلان الفرصة:',
                      details:
                          _opportunity.announcementEndDate?.getDateString() ??
                              '-',
                    ),
                    DetailsItem(
                      title: 'تاريخ انتهاء استقبال الطلبات:',
                      details: _opportunity.receiveApplicationsEndDate
                              ?.getDateString() ??
                          '-',
                    ),
                    DetailsItem(
                      title: 'تاريخ بدء البرنامج:',
                      details: _opportunity.actualProgramStartDate
                              ?.getDateString() ??
                          '-',
                    ),
                    DetailsItem(
                      title: 'تاريخ انتهاء البرنامج:',
                      details:
                          _opportunity.actualProgramEndDate?.getDateString() ??
                              '-',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        indent: 5,
                        endIndent: 5,
                      ),
                    ),
                    const Text('مهارات الطالب المتقدم المقترحة:',
                        style: TextStyle(
                          fontSize: 17,
                        )),
                    if (_opportunity.volunteerSkills?.isEmpty ?? true)
                      const Text('لم يتم تحديد مهارات',
                          style: TextStyle(
                            fontSize: 16,
                          ))
                    else
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: [
                          for (final SkillDto skill
                              in _opportunity.volunteerSkills ?? [])
                            ActionChip(
                                onPressed: () {},
                                backgroundColor: Colors.teal,
                                label: Text(
                                  skill.name ?? '-',
                                  style: const TextStyle(color: Colors.white),
                                )),
                        ],
                      ),
                    addVerticalSize(10),
                    if (_opportunity.isRequirementNeededAsText ?? false)
                      DetailsItem(
                        title: 'مؤهلات الطالب المطلوبة:',
                        details: _opportunity.applicantQualifications ?? '-',
                      ),
                    if (_opportunity.isRequirementNeededAsFile ?? false) ...[
                      DetailsItem(
                        title: 'وصف الملف المطلوب إرفاقه بالطلب:',
                        details: _opportunity.requirementFileDescription ?? '-',
                      ),
                      DetailsItem(
                        title: 'الحجم الأقصى للملف:',
                        details: _opportunity.requirementFileMaxAllowedSize
                                ?.toString() ??
                            '-',
                      ),
                      DetailsItem(
                        title: 'الأنواع المسموحة للملف:',
                        details:
                            _opportunity.requirementFileAllowedTypes ?? '-',
                      ),
                    ]
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                : _currentLogo != null
                                    ? Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                '$kDownloadFilesURL/${_currentLogo?.fileKey ?? ''}',
                                            httpHeaders: {
                                              'Authorization':
                                                  'Bearer ${globalAppStorage.getAccessToken()}'
                                            },
                                            imageBuilder: (ctx, image) {
                                              return Image(
                                                image: image,
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                              );
                                            },
                                            progressIndicatorBuilder:
                                                (ctx, url, downloadProgress) {
                                              return CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
                                              );
                                            },
                                            errorWidget: (ctx, url, error) {
                                              return const CircleAvatar(
                                                radius: 40,
                                                backgroundColor: Colors.grey,
                                                child: Icon(
                                                  Icons.error_outline,
                                                  size: 35,
                                                  color: Colors.black,
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _currentLogo = null;
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: const Center(
                                              child: Icon(Icons.add, size: 40)),
                                        ),
                                      ),
                          ),
                          addVerticalSize(10),
                          if (_selectedImage == null && _currentLogo == null)
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

                              if ((_selectedStopReceiveApplicationsDate) !=
                                  null) {
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
                              _selectedAnnouncementEndDate =
                                  await showDatePicker(
                                context: context,
                                initialDate: now,
                                firstDate: DateTime(now.year),
                                lastDate: now.add(const Duration(days: 500)),
                              );

                              if ((_selectedAnnouncementEndDate) != null) {
                                _announcementEndDateTEC.text =
                                    _selectedAnnouncementEndDate!
                                        .getDateString();
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
                              title: const Text(
                                  'متطلبات التقدم على شكل نص كتابي؟'),
                              onChanged: (selected) {
                                setState(() {
                                  _isRequirementNeededAsText =
                                      selected ?? false;
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
                                  _isRequirementNeededAsFile =
                                      selected ?? false;
                                });
                              }),
                          if (_isRequirementNeededAsFile)
                            ...[
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
                                            title:
                                                'اختيار أنواع الملفات المسموحة',
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
                                                        .containsKey(fileTypes
                                                            .keys
                                                            .elementAt(index)),
                                                    title: Text(fileTypes.keys
                                                        .elementAt(index)),
                                                    onChanged: (selected) {
                                                      sSetState(() {
                                                        if (selected ?? false) {
                                                          toSelectFileTypes
                                                              .addEntries([
                                                            fileTypes.entries
                                                                .elementAt(
                                                                    index)
                                                          ]);
                                                        } else {
                                                          toSelectFileTypes
                                                              .removeWhere((k,
                                                                      v) =>
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context,
                                                            toSelectFileTypes);
                                                      },
                                                      child:
                                                          const Text('اختيار')),
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
                            ),],
                          addVerticalSize(10),
                        ],
                      ),
                    ),
                    addVerticalSize(10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            BlocProvider.of<UpdateOpportunityCubit>(context)
                                .updateOpportunity(
                              UpdateVolunteerOpportunityDto(
                                id: _opportunity.id!,
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
                                announcementEndDate:
                                    _selectedAnnouncementEndDate,
                                requiredVolunteerStudentsNumber: int.parse(
                                    _requiredVolunteerStudentsNumberTEC.text),
                                isRequirementNeededAsText:
                                    _isRequirementNeededAsText,
                                applicantQualifications:
                                    _applicantQualificationsTEC.text,
                                isRequirementNeededAsFile:
                                    _isRequirementNeededAsFile,
                                requirementFileDescription: _fileDescTEC.text,
                                requirementFileMaxAllowedSize:
                                    double.tryParse(_fileMaxSizeTEC.text),
                                requirementFileAllowedTypes: _selectedFileTypes,
                                categoryId: _selectedCategory?.id,
                                volunteerSkills: _skills,
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: const Center(child: Text('حفظ التعديلات')),
                        ),
                      ),
                    ),
                    BlocConsumer<UpdateOpportunityCubit,
                        UpdateOpportunityState>(
                      listener: (context, state) {
                        if (state is UpdateOpportunityError) {
                          showNetworkException(
                              context: context, error: state.error);
                        }

                        if (state is UpdateOpportunitySuccess) {
                          setState(() {
                            _opportunity = state.data;
                            _editing = false;
                          });

                          showSuccessSnackBar(
                              context: context,
                              message: 'تم تعديل فرصة التطوع بنجاح');
                        }
                      },
                      builder: (context, state) {
                        if (state is UpdateOpportunityLoading) {
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
    );
  }
}
