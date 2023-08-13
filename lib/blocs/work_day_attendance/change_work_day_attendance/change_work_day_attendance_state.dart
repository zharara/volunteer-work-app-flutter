part of 'change_work_day_attendance_cubit.dart';

@immutable
abstract class ChangeWorkDayAttendanceState {}

class ChangeWorkDayAttendanceInitial extends ChangeWorkDayAttendanceState {}

class ChangeWorkDayAttendanceLoading extends ChangeWorkDayAttendanceState {}

class ChangeWorkDayAttendanceSuccess extends ChangeWorkDayAttendanceState {
  final VolunteerStudentWorkAttendanceDto data;

  ChangeWorkDayAttendanceSuccess(this.data);
}

class ChangeWorkDayAttendanceError extends ChangeWorkDayAttendanceState {
  final dynamic error;

  ChangeWorkDayAttendanceError(this.error);
}