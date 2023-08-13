part of 'get_task_accomplishes_of_volunteer_cubit.dart';

@immutable
abstract class GetTaskAccomplishesOfVolunteerState {}

class GetTaskAccomplishesOfVolunteerInitial extends GetTaskAccomplishesOfVolunteerState {}

class GetTaskAccomplishesOfVolunteerLoading extends GetTaskAccomplishesOfVolunteerState {}

class GetTaskAccomplishesOfVolunteerEmpty extends GetTaskAccomplishesOfVolunteerState {}

class GetTaskAccomplishesOfVolunteerError extends GetTaskAccomplishesOfVolunteerState {
  final dynamic error;

  GetTaskAccomplishesOfVolunteerError(this.error);
}

class GetTaskAccomplishesOfVolunteerSuccess extends GetTaskAccomplishesOfVolunteerState {
  final List<VolunteerStudentTaskAccomplishDto> data;

  GetTaskAccomplishesOfVolunteerSuccess(this.data);
}
