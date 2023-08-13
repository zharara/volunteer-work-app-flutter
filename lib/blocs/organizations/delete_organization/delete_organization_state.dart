part of 'delete_organization_cubit.dart';

@immutable
abstract class DeleteOrganizationState {}

class DeleteOrganizationInitial extends DeleteOrganizationState {}

class DeleteOrganizationLoading extends DeleteOrganizationState {}

class DeleteOrganizationSuccess extends DeleteOrganizationState {
  final OrganizationDto data;

  DeleteOrganizationSuccess(this.data);
}

class DeleteOrganizationError extends DeleteOrganizationState {
  final dynamic error;

  DeleteOrganizationError(this.error);
}
