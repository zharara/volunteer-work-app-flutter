import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/announcements/create_management_announcement/create_management_announcement_cubit.dart';

import '../../../../blocs/announcements/get_management_announcements/get_management_announcements_cubit.dart';
import '../../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class CreateManagementAnnouncementPage extends StatefulWidget {
  const CreateManagementAnnouncementPage({Key? key}) : super(key: key);

  @override
  State<CreateManagementAnnouncementPage> createState() =>
      _CreateManagementAnnouncementPageState();
}

class _CreateManagementAnnouncementPageState
    extends State<CreateManagementAnnouncementPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _descriptionTEC = TextEditingController();

  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateManagementAnnouncementCubit,
        CreateManagementAnnouncementState>(
      listener: (context, state) {
        if (state is CreateManagementAnnouncementError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is CreateManagementAnnouncementSuccess) {
          _formKey.currentState?.reset();
          _titleTEC.clear();
          _descriptionTEC.clear();

          _selectedImage = null;
          _uploadedImageTempFile = null;

          showSuccessSnackBar(
              context: context, message: 'تم إنشاء الإعلان العام بنجاح');
          context
              .read<GetManagementAnnouncementsCubit>()
              .getManagementAnnouncements();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء إعلان عام جديد'),
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
                    ],
                  ),
                ),
                addVerticalSize(10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        BlocProvider.of<CreateManagementAnnouncementCubit>(
                                context)
                            .createManagementAnnouncement(
                          title: _titleTEC.text,
                          description: _descriptionTEC.text,
                          saveTempFile: _uploadedImageTempFile != null
                              ? SaveTempFile(
                                  tempFileId: _uploadedImageTempFile!.id!)
                              : null,
                        );
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(child: Text('إنشاء إعلان عام')),
                    ),
                  ),
                ),
                BlocBuilder<CreateManagementAnnouncementCubit,
                    CreateManagementAnnouncementState>(
                  builder: (context, state) {
                    if (state is CreateManagementAnnouncementLoading) {
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
