part of 'get_organization_opportunities_cubit.dart';

@immutable
abstract class GetOrganizationOpportunitiesState {}

class GetOrganizationOpportunitiesInitial extends GetOrganizationOpportunitiesState {}

class GetOrganizationOpportunitiesLoading extends GetOrganizationOpportunitiesState {}

class GetOrganizationOpportunitiesEmpty extends GetOrganizationOpportunitiesState {}

class GetOrganizationOpportunitiesError extends GetOrganizationOpportunitiesState {
  final dynamic error;

  GetOrganizationOpportunitiesError(this.error);
}

class GetOrganizationOpportunitiesSuccess extends GetOrganizationOpportunitiesState {
  final List<VolunteerOpportunityDto> data;

  GetOrganizationOpportunitiesSuccess(this.data);
}
