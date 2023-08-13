part of 'create_program_cubit.dart';

@immutable
abstract class CreateProgramState {}

class CreateProgramInitial extends CreateProgramState {}

class CreateProgramLoading extends CreateProgramState {}

class CreateProgramError extends CreateProgramState {
  final dynamic error;

  CreateProgramError(this.error);
}

class CreateProgramSuccess extends CreateProgramState {
  final VolunteerProgramDto data;

  CreateProgramSuccess(this.data);
}
