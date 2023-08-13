part of 'update_student_by_management_cubit.dart';

@immutable
abstract class UpdateStudentByManagementState {}

class UpdateStudentByManagementInitial extends UpdateStudentByManagementState {}

class UpdateStudentByManagementLoading extends UpdateStudentByManagementState {}

class UpdateStudentByManagementSuccess extends UpdateStudentByManagementState {
  final StudentDto data;

  UpdateStudentByManagementSuccess(this.data);
}

class UpdateStudentByManagementError extends UpdateStudentByManagementState {
  final dynamic error;

  UpdateStudentByManagementError(this.error);
}
