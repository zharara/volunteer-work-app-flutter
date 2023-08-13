part of 'student_view_opportunities_cubit.dart';

@immutable
abstract class StudentViewOpportunitiesState {}

class StudentViewOpportunitiesInitial extends StudentViewOpportunitiesState {}

class StudentViewOpportunitiesLoading extends StudentViewOpportunitiesState {}

class StudentViewOpportunitiesEmpty extends StudentViewOpportunitiesState {}

class StudentViewOpportunitiesError extends StudentViewOpportunitiesState {
  final dynamic error;

  StudentViewOpportunitiesError(this.error);
}

class StudentViewOpportunitiesSuccess extends StudentViewOpportunitiesState {
  final List<VolunteerOpportunityDto> data;

  StudentViewOpportunitiesSuccess(this.data);
}
