part of 'create_student_account_cubit.dart';

@immutable
abstract class CreateStudentAccountState {}

class CreateStudentAccountInitial extends CreateStudentAccountState {}

class CreateStudentAccountLoading extends CreateStudentAccountState {}

class CreateStudentAccountSuccess extends CreateStudentAccountState {
  final StudentAccount data;

  CreateStudentAccountSuccess(this.data);
}

class CreateStudentAccountError extends CreateStudentAccountState {
  final dynamic error;

  CreateStudentAccountError(this.error);
}
