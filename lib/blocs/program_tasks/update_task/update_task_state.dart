part of 'update_task_cubit.dart';

@immutable
abstract class UpdateTaskState {}

class UpdateTaskInitial extends UpdateTaskState {}

class UpdateTaskLoading extends UpdateTaskState {}

class UpdateTaskSuccess extends UpdateTaskState {
  final VolunteerProgramTaskDto data;

  UpdateTaskSuccess(this.data);
}

class UpdateTaskError extends UpdateTaskState {
  final dynamic error;

  UpdateTaskError(this.error);
}
