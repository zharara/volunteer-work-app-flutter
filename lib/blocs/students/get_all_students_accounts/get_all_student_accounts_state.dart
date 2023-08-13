part of 'get_all_student_accounts_cubit.dart';

@immutable
abstract class GetAllStudentAccountsState {}

class GetAllStudentAccountsInitial extends GetAllStudentAccountsState {}

class GetAllStudentAccountsLoading extends GetAllStudentAccountsState {}

class GetAllStudentAccountsEmpty extends GetAllStudentAccountsState {}

class GetAllStudentAccountsError extends GetAllStudentAccountsState {
  final dynamic error;

  GetAllStudentAccountsError(this.error);
}

class GetAllStudentAccountsSuccess extends GetAllStudentAccountsState {
  final List<StudentDto> data;

  GetAllStudentAccountsSuccess(this.data);
}
