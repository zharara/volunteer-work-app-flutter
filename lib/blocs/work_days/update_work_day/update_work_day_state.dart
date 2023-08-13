part of 'update_work_day_cubit.dart';

@immutable
abstract class UpdateWorkDayState {}

class UpdateWorkDayInitial extends UpdateWorkDayState {}

class UpdateWorkDayLoading extends UpdateWorkDayState {}

class UpdateWorkDaySuccess extends UpdateWorkDayState {
  final VolunteerProgramWorkDayDto data;

  UpdateWorkDaySuccess(this.data);
}

class UpdateWorkDayError extends UpdateWorkDayState {
  final dynamic error;

  UpdateWorkDayError(this.error);
}
