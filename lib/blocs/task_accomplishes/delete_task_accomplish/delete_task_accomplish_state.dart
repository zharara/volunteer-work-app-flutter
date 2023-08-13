part of 'delete_task_accomplish_cubit.dart';

@immutable
abstract class DeleteTaskAccomplishState {}

class DeleteTaskAccomplishInitial extends DeleteTaskAccomplishState {}

class DeleteTaskAccomplishLoading extends DeleteTaskAccomplishState {}

class DeleteTaskAccomplishSuccess extends DeleteTaskAccomplishState {
  final VolunteerStudentTaskAccomplishDto data;

  DeleteTaskAccomplishSuccess(this.data);
}

class DeleteTaskAccomplishError extends DeleteTaskAccomplishState {
  final dynamic error;

  DeleteTaskAccomplishError(this.error);
}