part of 'organization_accept_application_cubit.dart';

@immutable
abstract class OrganizationAcceptApplicationState {}

class OrganizationAcceptApplicationInitial extends OrganizationAcceptApplicationState {}

class OrganizationAcceptApplicationLoading
    extends OrganizationAcceptApplicationState {}

class OrganizationAcceptApplicationSuccess
    extends OrganizationAcceptApplicationState {
  final StudentApplicationDto data;

  OrganizationAcceptApplicationSuccess(this.data);
}

class OrganizationAcceptApplicationError extends OrganizationAcceptApplicationState {
  final dynamic error;

  OrganizationAcceptApplicationError(this.error);
}