part of 'get_organization_by_id_cubit.dart';

@immutable
abstract class GetOrganizationByIdState {}

class GetOrganizationByIdInitial extends GetOrganizationByIdState {}

class GetOrganizationByIdLoading extends GetOrganizationByIdState {}

class GetOrganizationByIdSuccess extends GetOrganizationByIdState {
  final OrganizationDto data;

  GetOrganizationByIdSuccess(this.data);
}

class GetOrganizationByIdError extends GetOrganizationByIdState {
  final dynamic error;

  GetOrganizationByIdError(this.error);
}
