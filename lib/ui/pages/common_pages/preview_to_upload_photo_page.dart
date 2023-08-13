import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/blocs/program_photos/get_photos_of_program/get_photos_of_program_cubit.dart';

import '../../../blocs/program_photos/create_program_photo/create_program_photo_cubit.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';
import '../../../utils/exception_handlers.dart';
import '../../common_components/add_size.dart';
import '../../common_components/show_upload_files.dart';
import '../../common_components/snack_bars.dart';

class PreviewToUploadPhoto extends StatefulWidget {
  const PreviewToUploadPhoto(
      {Key? key, required this.image, required this.programId})
      : super(key: key);

  final File image;
  final int programId;

  @override
  State<PreviewToUploadPhoto> createState() => _PreviewToUploadPhotoState();
}

class _PreviewToUploadPhotoState extends State<PreviewToUploadPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة صورة جديدة لألبوم البرنامج'),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<CreateProgramPhotoCubit,
            CreateProgramPhotoState>(
          listener: (context, state) {
            if (state is CreateProgramPhotoError) {
              showNetworkException(context: context, error: state.error);
            }

            if (state is CreateProgramPhotoSuccess) {
              context
                  .read<GetPhotosOfProgramCubit>()
                  .addItemInternally(state.data);

              showSuccessSnackBar(
                  context: context,
                  message: 'تم حفظ الصورة في ألبوم البرنامج بنجاح');

              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.file(widget.image),
                ),
                addVerticalSize(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: state is CreateProgramPhotoLoading
                        ? null
                        : () async {
                            final tempFile =
                                await showUploadFile(context, widget.image);
                            if (tempFile != null) {
                              if (mounted) {
                                context
                                    .read<
                                        CreateProgramPhotoCubit>()
                                    .createProgramPhoto(
                                      CreateGalleryPhotoDto(
                                        saveTempFile: SaveTempFile(
                                            tempFileId: tempFile.id!),
                                        volunteerProgramId: widget.programId,
                                      ),
                                    );
                              }
                            }
                          },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Center(child: Text('إضافة الصورة')),
                    ),
                  ),
                ),
                if (state is CreateProgramPhotoLoading)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
