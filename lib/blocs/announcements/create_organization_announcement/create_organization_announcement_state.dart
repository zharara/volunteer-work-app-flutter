part of 'create_organization_announcement_cubit.dart';

@immutable
abstract class CreateOrganizationAnnouncementState {}

class CreateOrganizationAnnouncementInitial extends CreateOrganizationAnnouncementState {}

class CreateOrganizationAnnouncementLoading extends CreateOrganizationAnnouncementState {}

class CreateOrganizationAnnouncementError extends CreateOrganizationAnnouncementState {
  final dynamic error;

  CreateOrganizationAnnouncementError(this.error);
}

class CreateOrganizationAnnouncementSuccess extends CreateOrganizationAnnouncementState {
  final AnnouncementDto data;

  CreateOrganizationAnnouncementSuccess(this.data);
}
