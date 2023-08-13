part of 'get_volunteers_of_program_cubit.dart';

@immutable
abstract class GetVolunteersOfProgramState {}

class GetVolunteersOfProgramInitial extends GetVolunteersOfProgramState {}

class GetVolunteersOfProgramLoading extends GetVolunteersOfProgramState {}

class GetVolunteersOfProgramEmpty extends GetVolunteersOfProgramState {}

class GetVolunteersOfProgramError extends GetVolunteersOfProgramState {
  final dynamic error;

  GetVolunteersOfProgramError(this.error);
}

class GetVolunteersOfProgramSuccess extends GetVolunteersOfProgramState {
  final List<VolunteerStudentDto> data;

  GetVolunteersOfProgramSuccess(this.data);
}
