part of 'get_management_announcements_cubit.dart';

@immutable
abstract class GetManagementAnnouncementsState {}

class GetManagementAnnouncementsInitial extends GetManagementAnnouncementsState {}

class GetManagementAnnouncementsLoading extends GetManagementAnnouncementsState {}

class GetManagementAnnouncementsError extends GetManagementAnnouncementsState {
  final dynamic error;

  GetManagementAnnouncementsError(this.error);
}

class GetManagementAnnouncementsEmpty extends GetManagementAnnouncementsState {}

class GetManagementAnnouncementsSuccess extends GetManagementAnnouncementsState {
  final List<AnnouncementDto> data;

  GetManagementAnnouncementsSuccess(this.data);
}
