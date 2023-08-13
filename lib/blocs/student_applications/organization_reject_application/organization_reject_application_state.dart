part of 'organization_reject_application_cubit.dart';

@immutable
abstract class OrganizationRejectApplicationState {}

class OrganizationRejectApplicationInitial extends OrganizationRejectApplicationState {}

class OrganizationRejectApplicationLoading
    extends OrganizationRejectApplicationState {}

class OrganizationRejectApplicationSuccess
    extends OrganizationRejectApplicationState {
  final StudentApplicationDto data;

  OrganizationRejectApplicationSuccess(this.data);
}

class OrganizationRejectApplicationError extends OrganizationRejectApplicationState {
  final dynamic error;

  OrganizationRejectApplicationError(this.error);
}