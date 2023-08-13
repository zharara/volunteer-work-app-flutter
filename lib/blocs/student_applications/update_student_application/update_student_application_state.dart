part of 'update_student_application_cubit.dart';

@immutable
abstract class UpdateStudentApplicationState {}

class UpdateStudentApplicationInitial extends UpdateStudentApplicationState {}

class UpdateStudentApplicationLoading
    extends UpdateStudentApplicationState {}

class UpdateStudentApplicationSuccess
    extends UpdateStudentApplicationState {
  final StudentApplicationDto data;

  UpdateStudentApplicationSuccess(this.data);
}

class UpdateStudentApplicationError extends UpdateStudentApplicationState {
  final dynamic error;

  UpdateStudentApplicationError(this.error);
}
