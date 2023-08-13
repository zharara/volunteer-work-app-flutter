part of 'create_opportunity_cubit.dart';

@immutable
abstract class CreateOpportunityState {}

class CreateOpportunityInitial extends CreateOpportunityState {}

class CreateOpportunityLoading extends CreateOpportunityState {}

class CreateOpportunityError extends CreateOpportunityState {
  final dynamic error;

  CreateOpportunityError(this.error);
}

class CreateOpportunitySuccess extends CreateOpportunityState {
  final VolunteerOpportunityDto data;

  CreateOpportunitySuccess(this.data);
}
