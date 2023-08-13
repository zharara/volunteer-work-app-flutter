part of 'delete_task_cubit.dart';

@immutable
abstract class DeleteTaskState {}

class DeleteTaskInitial extends DeleteTaskState {}

class DeleteTaskLoading extends DeleteTaskState {}

class DeleteTaskSuccess extends DeleteTaskState {
  final VolunteerProgramTaskDto data;

  DeleteTaskSuccess(this.data);
}

class DeleteTaskError extends DeleteTaskState {
  final dynamic error;

  DeleteTaskError(this.error);
}
