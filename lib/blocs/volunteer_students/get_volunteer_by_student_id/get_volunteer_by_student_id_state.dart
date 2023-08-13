part of 'get_volunteer_by_student_id_cubit.dart';

@immutable
abstract class GetVolunteerByStudentIdState {}

class GetVolunteerByStudentIdInitial extends GetVolunteerByStudentIdState {}

class GetVolunteerByStudentIdLoading extends GetVolunteerByStudentIdState {}

class GetVolunteerByStudentIdError extends GetVolunteerByStudentIdState {
  final dynamic error;

  GetVolunteerByStudentIdError(this.error);
}

class GetVolunteerByStudentIdEmpty extends GetVolunteerByStudentIdState {}

class GetVolunteerByStudentIdSuccess extends GetVolunteerByStudentIdState {
  final VolunteerStudentDto data;

  GetVolunteerByStudentIdSuccess(this.data);
}
