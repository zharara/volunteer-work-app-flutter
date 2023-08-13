part of 'get_all_opportunities_cubit.dart';

@immutable
abstract class GetAllOpportunitiesState {}

class GetAllOpportunitiesInitial extends GetAllOpportunitiesState {}

class GetAllOpportunitiesLoading extends GetAllOpportunitiesState {}

class GetAllOpportunitiesEmpty extends GetAllOpportunitiesState {}

class GetAllOpportunitiesError extends GetAllOpportunitiesState {
  final dynamic error;

  GetAllOpportunitiesError(this.error);
}

class GetAllOpportunitiesSuccess extends GetAllOpportunitiesState {
  final List<VolunteerOpportunityDto> data;

  GetAllOpportunitiesSuccess(this.data);
}
