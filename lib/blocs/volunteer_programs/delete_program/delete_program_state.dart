part of 'delete_program_cubit.dart';

@immutable
abstract class DeleteProgramState {}

class DeleteProgramInitial extends DeleteProgramState {}

class DeleteProgramLoading extends DeleteProgramState {}

class DeleteProgramError extends DeleteProgramState {
  final dynamic error;

  DeleteProgramError(this.error);
}

class DeleteProgramSuccess extends DeleteProgramState {
  final VolunteerProgramDto data;

  DeleteProgramSuccess(this.data);
}
