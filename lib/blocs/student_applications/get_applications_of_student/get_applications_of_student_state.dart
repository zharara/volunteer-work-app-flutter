part of 'get_applications_of_student_cubit.dart';

@immutable
abstract class GetApplicationsOfStudentState {}

class GetApplicationsOfStudentInitial extends GetApplicationsOfStudentState {}

class GetApplicationsOfStudentLoading extends GetApplicationsOfStudentState {}

class GetApplicationsOfStudentError extends GetApplicationsOfStudentState {
  final dynamic error;

  GetApplicationsOfStudentError(this.error);
}

class GetApplicationsOfStudentEmpty extends GetApplicationsOfStudentState {}

class GetApplicationsOfStudentSuccess extends GetApplicationsOfStudentState {
  final List<StudentApplicationDto> data;

  GetApplicationsOfStudentSuccess(this.data);
}