part of 'update_program_cubit.dart';

@immutable
abstract class UpdateProgramState {}

class UpdateProgramInitial extends UpdateProgramState {}

class UpdateProgramLoading extends UpdateProgramState {}

class UpdateProgramError extends UpdateProgramState {
  final dynamic error;

  UpdateProgramError(this.error);
}

class UpdateProgramSuccess extends UpdateProgramState {
  final VolunteerProgramDto data;

  UpdateProgramSuccess(this.data);
}
