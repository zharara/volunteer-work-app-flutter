part of 'get_applications_for_organization_cubit.dart';

@immutable
abstract class GetApplicationsForOrganizationState {}

class GetApplicationsForOrganizationInitial extends GetApplicationsForOrganizationState {}

class GetApplicationsForOrganizationLoading extends GetApplicationsForOrganizationState {}

class GetApplicationsForOrganizationError extends GetApplicationsForOrganizationState {
  final dynamic error;

  GetApplicationsForOrganizationError(this.error);
}

class GetApplicationsForOrganizationEmpty extends GetApplicationsForOrganizationState {}

class GetApplicationsForOrganizationSuccess extends GetApplicationsForOrganizationState {
  final List<StudentApplicationDto> data;

  GetApplicationsForOrganizationSuccess(this.data);
}