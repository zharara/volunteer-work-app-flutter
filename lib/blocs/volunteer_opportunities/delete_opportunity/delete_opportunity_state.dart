part of 'delete_opportunity_cubit.dart';

@immutable
abstract class DeleteOpportunityState {}

class DeleteOpportunityInitial extends DeleteOpportunityState {}

class DeleteOpportunityLoading extends DeleteOpportunityState {}

class DeleteOpportunityError extends DeleteOpportunityState {
  final dynamic error;

  DeleteOpportunityError(this.error);
}

class DeleteOpportunitySuccess extends DeleteOpportunityState {
  final VolunteerOpportunityDto data;

  DeleteOpportunitySuccess(this.data);
}
