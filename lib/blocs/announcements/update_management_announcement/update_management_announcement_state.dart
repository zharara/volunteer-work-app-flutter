part of 'update_management_announcement_cubit.dart';

@immutable
abstract class UpdateManagementAnnouncementState {}

class UpdateManagementAnnouncementInitial extends UpdateManagementAnnouncementState {}

class UpdateManagementAnnouncementLoading extends UpdateManagementAnnouncementState {}

class UpdateManagementAnnouncementError extends UpdateManagementAnnouncementState {
  final dynamic error;

  UpdateManagementAnnouncementError(this.error);
}

class UpdateManagementAnnouncementSuccess extends UpdateManagementAnnouncementState {
  final AnnouncementDto data;

  UpdateManagementAnnouncementSuccess(this.data);
}
