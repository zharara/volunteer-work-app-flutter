import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/volunteer_programs/update_internal_program/update_internal_program_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/select_category_input.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class UpdateInternalProgramPage extends StatefulWidget {
  const UpdateInternalProgramPage({Key? key, required this.programDto})
      : super(key: key);

  final VolunteerProgramDto programDto;

  @override
  State<UpdateInternalProgramPage> createState() =>
      _UpdateInternalProgramPageState();
}

class _UpdateInternalProgramPageState extends State<UpdateInternalProgramPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _descriptionTEC = TextEditingController();

  final TextEditingController _categoryTEC = TextEditingController();
  final TextEditingController _opportunityTEC = TextEditingController();

  final TextEditingController _startDateTEC = TextEditingController();
  final TextEditingController _endDateTEC = TextEditingController();

  CategoryDto? _selectedCategory;
  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;
  SavedFileDto? _currentLogo;

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  void initState() {
    super.initState();

    _currentLogo = widget.programDto.logo;

    _titleTEC.text = widget.programDto.title ?? '';
    _descriptionTEC.text = widget.programDto.description ?? '';

    _categoryTEC.text = widget.programDto.category?.name ?? '';
    _startDateTEC.text = widget.programDto.startDate?.getDateString() ?? '';
    _endDateTEC.text = widget.programDto.endDate?.getDateString() ?? '';

    _selectedCategory = widget.programDto.category;
    _selectedStartDate = widget.programDto.startDate;
    _selectedEndDate = widget.programDto.endDate;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateInternalProgramCubit, UpdateInternalProgramState>(
      listener: (context, state) {
        if (state is UpdateInternalProgramError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is UpdateInternalProgramSuccess) {
          Navigator.pop(context);

          showSuccessSnackBar(
              context: context, message: 'تم تعديل برنامج التطوع بنجاح');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تعديل برنامج التطوع الداخلي'),
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
                                            value: downloadProgress.progress,
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
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height:
                                          MediaQuery.of(context).size.width / 3,
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
                    ],
                  ),
                ),
                addVerticalSize(20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        BlocProvider.of<UpdateInternalProgramCubit>(context)
                            .updateInternalProgram(
                          UpdateInternalVolunteerProgramDto(
                            id: widget.programDto.id ?? 0,
                            title: _titleTEC.text,
                            description: _descriptionTEC.text,
                            startDate: _selectedStartDate!,
                            endDate: _selectedEndDate!,
                            categoryId: _selectedCategory?.id,
                            saveTempFile: _uploadedImageTempFile != null
                                ? SaveTempFile(
                                    tempFileId: _uploadedImageTempFile!.id!,
                                  )
                                : null,
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child:
                          const Center(child: Text('تعديل البرنامج الداخلي')),
                    ),
                  ),
                ),
                BlocBuilder<UpdateInternalProgramCubit,
                    UpdateInternalProgramState>(
                  builder: (context, state) {
                    if (state is UpdateInternalProgramLoading) {
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
