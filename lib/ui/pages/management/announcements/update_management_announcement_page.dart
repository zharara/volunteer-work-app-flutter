import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../../blocs/announcements/get_management_announcements/get_management_announcements_cubit.dart';
import '../../../../blocs/announcements/update_management_announcement/update_management_announcement_cubit.dart';
import '../../../../constants/api_constants.dart';
import '../../../../main.dart';
import '../../../../utils/exception_handlers.dart';
import '../../../../utils/form_validators.dart';
import '../../../../utils/pick_images.dart';
import '../../../common_components/add_size.dart';
import '../../../common_components/centered_progress_indicator.dart';
import '../../../common_components/input_page_title.dart';
import '../../../common_components/show_upload_files.dart';
import '../../../common_components/snack_bars.dart';

class UpdateManagementAnnouncementPage extends StatefulWidget {
  const UpdateManagementAnnouncementPage({Key? key, required this.announcementDto}) : super(key: key);

  final AnnouncementDto announcementDto;

  @override
  State<UpdateManagementAnnouncementPage> createState() => _UpdateManagementAnnouncementPageState();
}

class _UpdateManagementAnnouncementPageState extends State<UpdateManagementAnnouncementPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _descriptionTEC = TextEditingController();

  TempFileDto? _uploadedImageTempFile;
  File? _selectedImage;
  SavedFileDto? _currentLogo;

  @override
  void initState() {
    super.initState();

    _currentLogo = widget.announcementDto.image;

    _titleTEC.text = widget.announcementDto.title ?? '';
    _descriptionTEC.text = widget.announcementDto.description ?? '';

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateManagementAnnouncementCubit,
        UpdateManagementAnnouncementState>(
      listener: (context, state) {
        if (state is UpdateManagementAnnouncementError) {
          showNetworkException(context: context, error: state.error);
        }

        if (state is UpdateManagementAnnouncementSuccess) {
          _formKey.currentState?.reset();
          _titleTEC.clear();
          _descriptionTEC.clear();

          _selectedImage = null;
          _uploadedImageTempFile = null;

          context
              .read<GetManagementAnnouncementsCubit>()
              .getManagementAnnouncements();

          showSuccessSnackBar(
              context: context, message: 'تم تعديل الإعلان العام بنجاح');


          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تعديل إعلان عام'),
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
                        BlocProvider.of<UpdateManagementAnnouncementCubit>(
                            context)
                            .updateManagementAnnouncement(
                          announcementId: widget.announcementDto.id ?? 0,
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
                      child: const Center(child: Text('تعديل الإعلان')),
                    ),
                  ),
                ),
                BlocBuilder<UpdateManagementAnnouncementCubit,
                    UpdateManagementAnnouncementState>(
                  builder: (context, state) {
                    if (state is UpdateManagementAnnouncementLoading) {
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
