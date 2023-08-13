part of 'get_applications_for_opportunity_cubit.dart';

@immutable
abstract class GetApplicationsForOpportunityState {}

class GetApplicationsForOpportunityInitial extends GetApplicationsForOpportunityState {}

class GetApplicationsForOpportunityLoading extends GetApplicationsForOpportunityState {}

class GetApplicationsForOpportunityError extends GetApplicationsForOpportunityState {
  final dynamic error;

  GetApplicationsForOpportunityError(this.error);
}

class GetApplicationsForOpportunityEmpty extends GetApplicationsForOpportunityState {}

class GetApplicationsForOpportunitySuccess extends GetApplicationsForOpportunityState {
  final List<StudentApplicationDto> data;

  GetApplicationsForOpportunitySuccess(this.data);
}