part of 'update_student_account_cubit.dart';

@immutable
abstract class UpdateStudentAccountState {}

class UpdateStudentAccountInitial extends UpdateStudentAccountState {}

class UpdateStudentAccountLoading extends UpdateStudentAccountState {}

class UpdateStudentAccountSuccess extends UpdateStudentAccountState {
  final StudentDto data;

  UpdateStudentAccountSuccess(this.data);
}

class UpdateStudentAccountError extends UpdateStudentAccountState {
  final dynamic error;

  UpdateStudentAccountError(this.error);
}
