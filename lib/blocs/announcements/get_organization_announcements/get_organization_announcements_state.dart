part of 'get_organization_announcements_cubit.dart';

@immutable
abstract class GetOrganizationAnnouncementsState {}

class GetOrganizationAnnouncementsInitial extends GetOrganizationAnnouncementsState {}

class GetOrganizationAnnouncementsLoading extends GetOrganizationAnnouncementsState {}

class GetOrganizationAnnouncementsError extends GetOrganizationAnnouncementsState {
  final dynamic error;

  GetOrganizationAnnouncementsError(this.error);
}

class GetOrganizationAnnouncementsEmpty extends GetOrganizationAnnouncementsState {}

class GetOrganizationAnnouncementsSuccess extends GetOrganizationAnnouncementsState {
  final List<AnnouncementDto> data;

  GetOrganizationAnnouncementsSuccess(this.data);
}
