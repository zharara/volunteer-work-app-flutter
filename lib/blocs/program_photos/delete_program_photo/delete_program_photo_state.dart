part of 'delete_program_photo_cubit.dart';

@immutable
abstract class DeleteProgramPhotoState {}

class DeleteProgramPhotoInitial extends DeleteProgramPhotoState {}

class DeleteProgramPhotoLoading extends DeleteProgramPhotoState {}

class DeleteProgramPhotoSuccess extends DeleteProgramPhotoState {
  final VolunteerProgramGalleryPhotoDto data;

  DeleteProgramPhotoSuccess(this.data);
}

class DeleteProgramPhotoError extends DeleteProgramPhotoState {
  final dynamic error;

  DeleteProgramPhotoError(this.error);
}
