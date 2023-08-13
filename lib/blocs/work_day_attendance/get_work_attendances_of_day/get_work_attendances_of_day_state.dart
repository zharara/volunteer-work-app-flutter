part of 'get_work_attendances_of_day_cubit.dart';

@immutable
abstract class GetWorkAttendancesOfDayState {}

class GetWorkAttendancesOfDayInitial extends GetWorkAttendancesOfDayState {}

class GetWorkAttendancesOfDayLoading extends GetWorkAttendancesOfDayState {}

class GetWorkAttendancesOfDayEmpty extends GetWorkAttendancesOfDayState {}

class GetWorkAttendancesOfDayError extends GetWorkAttendancesOfDayState {
  final dynamic error;

  GetWorkAttendancesOfDayError(this.error);
}

class GetWorkAttendancesOfDaySuccess extends GetWorkAttendancesOfDayState {
  final List<VolunteerStudentWorkAttendanceDto> data;

  GetWorkAttendancesOfDaySuccess(this.data);
}
