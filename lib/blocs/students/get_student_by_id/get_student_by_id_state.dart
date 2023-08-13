part of 'get_student_by_id_cubit.dart';

@immutable
abstract class GetStudentByIdState {}

class GetStudentByIdInitial extends GetStudentByIdState {}

class GetStudentByIdLoading extends GetStudentByIdState {}

class GetStudentByIdSuccess extends GetStudentByIdState {
  final StudentDto data;

  GetStudentByIdSuccess(this.data);
}

class GetStudentByIdError extends GetStudentByIdState {
  final dynamic error;

  GetStudentByIdError(this.error);
}
