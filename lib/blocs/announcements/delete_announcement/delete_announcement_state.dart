part of 'delete_announcement_cubit.dart';

@immutable
abstract class DeleteAnnouncementState {}

class DeleteAnnouncementInitial extends DeleteAnnouncementState {}

class DeleteAnnouncementLoading extends DeleteAnnouncementState {}

class DeleteAnnouncementError extends DeleteAnnouncementState {
  final dynamic error;

  DeleteAnnouncementError(this.error);
}

class DeleteAnnouncementSuccess extends DeleteAnnouncementState {
  final AnnouncementDto data;

  DeleteAnnouncementSuccess(this.data);
}
