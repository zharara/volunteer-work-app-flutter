part of 'check_student_applied_to_opportunity_cubit.dart';

@immutable
abstract class CheckStudentAppliedToOpportunityState {}

class CheckStudentAppliedToOpportunityInitial extends CheckStudentAppliedToOpportunityState {}

class CheckStudentAppliedToOpportunityLoading extends CheckStudentAppliedToOpportunityState {}

class CheckStudentAppliedToOpportunityError extends CheckStudentAppliedToOpportunityState {
  final dynamic error;

  CheckStudentAppliedToOpportunityError(this.error);
}

class CheckStudentAppliedToOpportunityEmpty extends CheckStudentAppliedToOpportunityState {}

class CheckStudentAppliedToOpportunitySuccess extends CheckStudentAppliedToOpportunityState {
  final List<StudentApplicationDto> data;

  CheckStudentAppliedToOpportunitySuccess(this.data);
}