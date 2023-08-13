part of 'delete_work_day_cubit.dart';

@immutable
abstract class DeleteWorkDayState {}

class DeleteWorkDayInitial extends DeleteWorkDayState {}

class DeleteWorkDayLoading extends DeleteWorkDayState {}

class DeleteWorkDaySuccess extends DeleteWorkDayState {
  final VolunteerProgramWorkDayDto data;

  DeleteWorkDaySuccess(this.data);
}

class DeleteWorkDayError extends DeleteWorkDayState {
  final dynamic error;

  DeleteWorkDayError(this.error);
}
