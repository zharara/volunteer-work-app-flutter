part of 'update_internal_program_cubit.dart';

@immutable
abstract class UpdateInternalProgramState {}

class UpdateInternalProgramInitial extends UpdateInternalProgramState {}

class UpdateInternalProgramLoading extends UpdateInternalProgramState {}

class UpdateInternalProgramError extends UpdateInternalProgramState {
  final dynamic error;

  UpdateInternalProgramError(this.error);
}

class UpdateInternalProgramSuccess extends UpdateInternalProgramState {
  final VolunteerProgramDto data;

  UpdateInternalProgramSuccess(this.data);
}
