part of 'create_internal_program_cubit.dart';

@immutable
abstract class CreateInternalProgramState {}

class CreateInternalProgramInitial extends CreateInternalProgramState {}

class CreateInternalProgramLoading extends CreateInternalProgramState {}

class CreateInternalProgramError extends CreateInternalProgramState {
  final dynamic error;

  CreateInternalProgramError(this.error);
}

class CreateInternalProgramSuccess extends CreateInternalProgramState {
  final VolunteerProgramDto data;

  CreateInternalProgramSuccess(this.data);
}
