part of 'update_opportunity_cubit.dart';

@immutable
abstract class UpdateOpportunityState {}

class UpdateOpportunityInitial extends UpdateOpportunityState {}

class UpdateOpportunityLoading extends UpdateOpportunityState {}

class UpdateOpportunityError extends UpdateOpportunityState {
  final dynamic error;

  UpdateOpportunityError(this.error);
}

class UpdateOpportunitySuccess extends UpdateOpportunityState {
  final VolunteerOpportunityDto data;

  UpdateOpportunitySuccess(this.data);
}
