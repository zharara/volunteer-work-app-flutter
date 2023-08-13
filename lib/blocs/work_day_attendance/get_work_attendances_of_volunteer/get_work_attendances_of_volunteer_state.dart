part of 'get_work_attendances_of_volunteer_cubit.dart';

@immutable
abstract class GetWorkAttendancesOfVolunteerState {}

class GetWorkAttendancesOfVolunteerInitial extends GetWorkAttendancesOfVolunteerState {}

class GetWorkAttendancesOfVolunteerLoading extends GetWorkAttendancesOfVolunteerState {}

class GetWorkAttendancesOfVolunteerEmpty extends GetWorkAttendancesOfVolunteerState {}

class GetWorkAttendancesOfVolunteerError extends GetWorkAttendancesOfVolunteerState {
  final dynamic error;

  GetWorkAttendancesOfVolunteerError(this.error);
}

class GetWorkAttendancesOfVolunteerSuccess extends GetWorkAttendancesOfVolunteerState {
  final List<VolunteerStudentWorkAttendanceDto> data;

  GetWorkAttendancesOfVolunteerSuccess(this.data);
}
