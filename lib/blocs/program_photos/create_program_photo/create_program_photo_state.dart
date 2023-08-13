part of 'create_program_photo_cubit.dart';

@immutable
abstract class CreateProgramPhotoState {}

class CreateProgramPhotoInitial extends CreateProgramPhotoState {}

class CreateProgramPhotoLoading extends CreateProgramPhotoState {}

class CreateProgramPhotoSuccess extends CreateProgramPhotoState {
  final VolunteerProgramGalleryPhotoDto data;

  CreateProgramPhotoSuccess(this.data);
}

class CreateProgramPhotoError extends CreateProgramPhotoState {
  final dynamic error;

  CreateProgramPhotoError(this.error);
}
