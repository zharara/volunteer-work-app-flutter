part of 'get_work_days_of_program_cubit.dart';

@immutable
abstract class GetWorkDaysOfProgramState {}

class GetWorkDaysOfProgramInitial extends GetWorkDaysOfProgramState {}

class GetWorkDaysOfProgramLoading extends GetWorkDaysOfProgramState {}

class GetWorkDaysOfProgramEmpty extends GetWorkDaysOfProgramState {}

class GetWorkDaysOfProgramError extends GetWorkDaysOfProgramState {
  final dynamic error;

  GetWorkDaysOfProgramError(this.error);
}

class GetWorkDaysOfProgramSuccess extends GetWorkDaysOfProgramState {
  final List<VolunteerProgramWorkDayDto> data;

  GetWorkDaysOfProgramSuccess(this.data);
}
