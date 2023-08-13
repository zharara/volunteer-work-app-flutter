part of 'change_volunteer_grade_cubit.dart';

@immutable
abstract class ChangeVolunteerGradeState {}

class ChangeVolunteerGradeInitial extends ChangeVolunteerGradeState {}

class ChangeVolunteerGradeLoading extends ChangeVolunteerGradeState {}

class ChangeVolunteerGradeSuccess extends ChangeVolunteerGradeState {
  final VolunteerStudentDto data;

  ChangeVolunteerGradeSuccess(this.data);
}

class ChangeVolunteerGradeError extends ChangeVolunteerGradeState {
  final dynamic error;

  ChangeVolunteerGradeError(this.error);
}