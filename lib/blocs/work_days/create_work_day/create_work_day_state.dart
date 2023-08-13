part of 'create_work_day_cubit.dart';

@immutable
abstract class CreateWorkDayState {}

class CreateWorkDayInitial extends CreateWorkDayState {}

class CreateWorkDayLoading extends CreateWorkDayState {}

class CreateWorkDaySuccess extends CreateWorkDayState {
  final VolunteerProgramWorkDayDto data;

  CreateWorkDaySuccess(this.data);
}

class CreateWorkDayError extends CreateWorkDayState {
  final dynamic error;

  CreateWorkDayError(this.error);
}
