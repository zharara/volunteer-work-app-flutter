import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/utils/extensions/date_time_extensions.dart';

import '../../../../blocs/volunteer_programs/create_internal_program/create_internal_program_cubit.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/select_category_input.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class CreateInternalProgramPage extends StatefulWidget {
  const CreateInternalProgramPage({Key? key}) : super(key: key);

  @override
  State<CreateInternalProgramPage> createState() =>
      _CreateInternalProgramPageState();
}

class _CreateInternalProgramPageState extends State<CreateInternalProgramPage> {
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

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateInternalProgramCubit, CreateInternalProgramState>(
      listener: (context, state) {
        if (state is CreateInternalProgramError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is CreateInternalProgramSuccess) {
          _formKey.currentState?.reset();
          _titleTEC.clear();
          _descriptionTEC.clear();
          _categoryTEC.clear();
          _opportunityTEC.clear();
          _startDateTEC.clear();
          _endDateTEC.clear();

          _selectedStartDate = null;
          _selectedEndDate = null;

          setState(() {
            _selectedCategory = null;
            _selectedImage = null;
            _uploadedImageTempFile = null;
          });

          showSuccessSnackBar(
              context: context, message: 'تم إنشاء برنامج التطوع بنجاح');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء برنامج تطوع داخلي جديد'),
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
                        BlocProvider.of<CreateInternalProgramCubit>(context)
                            .createInternalProgram(
                          CreateInternalVolunteerProgramDto(
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
                      child: const Center(child: Text('إنشاء برنامج داخلي')),
                    ),
                  ),
                ),
                BlocBuilder<CreateInternalProgramCubit,
                    CreateInternalProgramState>(
                  builder: (context, state) {
                    if (state is CreateInternalProgramLoading) {
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
