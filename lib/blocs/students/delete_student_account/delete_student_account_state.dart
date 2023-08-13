part of 'delete_student_account_cubit.dart';

@immutable
abstract class DeleteStudentAccountState {}

class DeleteStudentAccountInitial extends DeleteStudentAccountState {}

class DeleteStudentAccountLoading extends DeleteStudentAccountState {}

class DeleteStudentAccountSuccess extends DeleteStudentAccountState {
  final StudentDto data;

  DeleteStudentAccountSuccess(this.data);
}

class DeleteStudentAccountError extends DeleteStudentAccountState {
  final dynamic error;

  DeleteStudentAccountError(this.error);
}
