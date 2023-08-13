part of 'delete_volunteer_cubit.dart';

@immutable
abstract class DeleteVolunteerState {}

class DeleteVolunteerInitial extends DeleteVolunteerState {}

class DeleteVolunteerLoading extends DeleteVolunteerState {}

class DeleteVolunteerSuccess extends DeleteVolunteerState {
  final VolunteerStudentDto data;

  DeleteVolunteerSuccess(this.data);
}

class DeleteVolunteerError extends DeleteVolunteerState {
  final dynamic error;

  DeleteVolunteerError(this.error);
}
