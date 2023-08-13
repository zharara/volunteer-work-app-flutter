part of 'change_task_accomplish_cubit.dart';

@immutable
abstract class ChangeTaskAccomplishState {}

class ChangeTaskAccomplishInitial extends ChangeTaskAccomplishState {}

class ChangeTaskAccomplishLoading extends ChangeTaskAccomplishState {}

class ChangeTaskAccomplishSuccess extends ChangeTaskAccomplishState {
  final VolunteerStudentTaskAccomplishDto data;

  ChangeTaskAccomplishSuccess(this.data);
}

class ChangeTaskAccomplishError extends ChangeTaskAccomplishState {
  final dynamic error;

  ChangeTaskAccomplishError(this.error);
}
