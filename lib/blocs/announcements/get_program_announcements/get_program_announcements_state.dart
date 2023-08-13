part of 'get_program_announcements_cubit.dart';

@immutable
abstract class GetProgramAnnouncementsState {}

class GetProgramAnnouncementsInitial extends GetProgramAnnouncementsState {}

class GetProgramAnnouncementsLoading extends GetProgramAnnouncementsState {}

class GetProgramAnnouncementsError extends GetProgramAnnouncementsState {
  final dynamic error;

  GetProgramAnnouncementsError(this.error);
}

class GetProgramAnnouncementsEmpty extends GetProgramAnnouncementsState {}

class GetProgramAnnouncementsSuccess extends GetProgramAnnouncementsState {
  final List<AnnouncementDto> data;

  GetProgramAnnouncementsSuccess(this.data);
}
