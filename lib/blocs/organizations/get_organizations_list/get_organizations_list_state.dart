part of 'get_organizations_list_cubit.dart';

@immutable
abstract class GetOrganizationsListState {}

class GetOrganizationsListInitial extends GetOrganizationsListState {}

class GetOrganizationsListLoading extends GetOrganizationsListState {}

class GetOrganizationsListEmpty extends GetOrganizationsListState {}

class GetOrganizationsListError extends GetOrganizationsListState {
  final dynamic error;

  GetOrganizationsListError(this.error);
}

class GetOrganizationsListSuccess extends GetOrganizationsListState {
  final List<OrganizationDto> data;

  GetOrganizationsListSuccess(this.data);
}
