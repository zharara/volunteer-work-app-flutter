part of 'get_accomplishes_of_task_cubit.dart';

@immutable
abstract class GetAccomplishesOfTaskState {}

class GetAccomplishesOfTaskInitial extends GetAccomplishesOfTaskState {}

class GetAccomplishesOfTaskLoading extends GetAccomplishesOfTaskState {}

class GetAccomplishesOfTaskEmpty extends GetAccomplishesOfTaskState {}

class GetAccomplishesOfTaskError extends GetAccomplishesOfTaskState {
  final dynamic error;

  GetAccomplishesOfTaskError(this.error);
}

class GetAccomplishesOfTaskSuccess extends GetAccomplishesOfTaskState {
  final List<VolunteerStudentTaskAccomplishDto> data;

  GetAccomplishesOfTaskSuccess(this.data);
}
