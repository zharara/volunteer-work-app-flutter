part of 'get_not_volunteer_students_cubit.dart';

@immutable
abstract class GetNotVolunteerStudentsState {}

class GetNotVolunteerStudentsInitial extends GetNotVolunteerStudentsState {}

class GetNotVolunteerStudentsLoading extends GetNotVolunteerStudentsState {}

class GetNotVolunteerStudentsEmpty extends GetNotVolunteerStudentsState {}

class GetNotVolunteerStudentsError extends GetNotVolunteerStudentsState {
  final dynamic error;

  GetNotVolunteerStudentsError(this.error);
}

class GetNotVolunteerStudentsSuccess extends GetNotVolunteerStudentsState {
  final List<StudentDto> data;

  GetNotVolunteerStudentsSuccess(this.data);
}
