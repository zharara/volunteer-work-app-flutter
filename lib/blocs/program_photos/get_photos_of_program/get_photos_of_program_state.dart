part of 'get_photos_of_program_cubit.dart';

@immutable
abstract class GetPhotosOfProgramState {}

class GetPhotosOfProgramInitial extends GetPhotosOfProgramState {}

class GetPhotosOfProgramLoading extends GetPhotosOfProgramState {}

class GetPhotosOfProgramError extends GetPhotosOfProgramState {
  final dynamic error;

  GetPhotosOfProgramError(this.error);
}

class GetPhotosOfProgramEmpty extends GetPhotosOfProgramState {}

class GetPhotosOfProgramSuccess extends GetPhotosOfProgramState {
  final List<VolunteerProgramGalleryPhotoDto> data;

  GetPhotosOfProgramSuccess(this.data);
}