part of 'create_management_announcement_cubit.dart';

@immutable
abstract class CreateManagementAnnouncementState {}

class CreateManagementAnnouncementInitial extends CreateManagementAnnouncementState {}

class CreateManagementAnnouncementLoading extends CreateManagementAnnouncementState {}

class CreateManagementAnnouncementError extends CreateManagementAnnouncementState {
  final dynamic error;

  CreateManagementAnnouncementError(this.error);
}

class CreateManagementAnnouncementSuccess extends CreateManagementAnnouncementState {
  final AnnouncementDto data;

  CreateManagementAnnouncementSuccess(this.data);
}
