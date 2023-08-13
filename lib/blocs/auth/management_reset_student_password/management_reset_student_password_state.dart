part of 'management_reset_student_password_cubit.dart';

@immutable
abstract class ManagementResetStudentPasswordState {}

class ManagementResetStudentPasswordInitial extends ManagementResetStudentPasswordState {}

class ManagementResetStudentPasswordLoading extends ManagementResetStudentPasswordState {}

class ManagementResetStudentPasswordError extends ManagementResetStudentPasswordState {
  final dynamic error;

  ManagementResetStudentPasswordError(this.error);
}

class ManagementResetStudentPasswordSuccess extends ManagementResetStudentPasswordState {
  final dynamic data;

  ManagementResetStudentPasswordSuccess(this.data);
}
