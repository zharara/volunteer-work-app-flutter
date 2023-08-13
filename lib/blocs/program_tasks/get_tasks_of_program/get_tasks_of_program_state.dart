part of 'get_tasks_of_program_cubit.dart';

@immutable
abstract class GetTasksOfProgramState {}

class GetTasksOfProgramInitial extends GetTasksOfProgramState {}

class GetTasksOfProgramLoading extends GetTasksOfProgramState {}

class GetTasksOfProgramError extends GetTasksOfProgramState {
  final dynamic error;

  GetTasksOfProgramError(this.error);
}

class GetTasksOfProgramEmpty extends GetTasksOfProgramState {}

class GetTasksOfProgramSuccess extends GetTasksOfProgramState {
  final List<VolunteerProgramTaskDto> data;

  GetTasksOfProgramSuccess(this.data);
}