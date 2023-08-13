part of 'update_organization_profile_cubit.dart';

@immutable
abstract class UpdateOrganizationProfileState {}

class UpdateOrganizationProfileInitial extends UpdateOrganizationProfileState {}

class UpdateOrganizationProfileLoading extends UpdateOrganizationProfileState {}

class UpdateOrganizationProfileSuccess extends UpdateOrganizationProfileState {
  final OrganizationDto data;

  UpdateOrganizationProfileSuccess(this.data);
}

class UpdateOrganizationProfileError extends UpdateOrganizationProfileState {
  final dynamic error;

  UpdateOrganizationProfileError(this.error);
}
