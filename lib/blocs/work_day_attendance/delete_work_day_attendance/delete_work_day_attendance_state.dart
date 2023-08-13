part of 'delete_work_day_attendance_cubit.dart';

@immutable
abstract class DeleteWorkDayAttendanceState {}

class DeleteWorkDayAttendanceInitial extends DeleteWorkDayAttendanceState {}

class DeleteWorkDayAttendanceLoading extends DeleteWorkDayAttendanceState {}

class DeleteWorkDayAttendanceSuccess extends DeleteWorkDayAttendanceState {
  final VolunteerStudentWorkAttendanceDto data;

  DeleteWorkDayAttendanceSuccess(this.data);
}

class DeleteWorkDayAttendanceError extends DeleteWorkDayAttendanceState {
  final dynamic error;

  DeleteWorkDayAttendanceError(this.error);
}