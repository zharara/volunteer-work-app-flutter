part of 'add_volunteer_to_program_cubit.dart';

@immutable
abstract class AddVolunteerToProgramState {}

class AddVolunteerToProgramInitial extends AddVolunteerToProgramState {}

class AddVolunteerToProgramLoading extends AddVolunteerToProgramState {}

class AddVolunteerToProgramSuccess extends AddVolunteerToProgramState {
  final VolunteerStudentDto data;

  AddVolunteerToProgramSuccess(this.data);
}

class AddVolunteerToProgramError extends AddVolunteerToProgramState {
  final dynamic error;

  AddVolunteerToProgramError(this.error);
}
