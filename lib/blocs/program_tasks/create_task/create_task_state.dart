part of 'create_task_cubit.dart';

@immutable
abstract class CreateTaskState {}

class CreateTaskInitial extends CreateTaskState {}

class CreateTaskLoading extends CreateTaskState {}

class CreateTaskSuccess extends CreateTaskState {
  final VolunteerProgramTaskDto data;

  CreateTaskSuccess(this.data);
}

class CreateTaskError extends CreateTaskState {
  final dynamic error;

  CreateTaskError(this.error);
}
