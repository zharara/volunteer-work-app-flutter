part of 'get_organizations_for_home_cubit.dart';

@immutable
abstract class GetOrganizationsForHomeState {}

class GetOrganizationsForHomeInitial extends GetOrganizationsForHomeState {}

class GetOrganizationsForHomeLoading extends GetOrganizationsForHomeState {}

class GetOrganizationsForHomeEmpty extends GetOrganizationsForHomeState {}

class GetOrganizationsForHomeError extends GetOrganizationsForHomeState {
  final dynamic error;

  GetOrganizationsForHomeError(this.error);
}

class GetOrganizationsForHomeSuccess extends GetOrganizationsForHomeState {
  final List<OrganizationDto> data;

  GetOrganizationsForHomeSuccess(this.data);
}
