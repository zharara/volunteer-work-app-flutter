part of 'update_organization_announcement_cubit.dart';

@immutable
abstract class UpdateOrganizationAnnouncementState {}

class UpdateOrganizationAnnouncementInitial extends UpdateOrganizationAnnouncementState {}

class UpdateOrganizationAnnouncementLoading extends UpdateOrganizationAnnouncementState {}

class UpdateOrganizationAnnouncementError extends UpdateOrganizationAnnouncementState {
  final dynamic error;

  UpdateOrganizationAnnouncementError(this.error);
}

class UpdateOrganizationAnnouncementSuccess extends UpdateOrganizationAnnouncementState {
  final AnnouncementDto data;

  UpdateOrganizationAnnouncementSuccess(this.data);
}
