part of 'get_all_volunteers_cubit.dart';

@immutable
abstract class GetAllVolunteersState {}

class GetAllVolunteersInitial extends GetAllVolunteersState {}

class GetAllVolunteersLoading extends GetAllVolunteersState {}

class GetAllVolunteersEmpty extends GetAllVolunteersState {}

class GetAllVolunteersError extends GetAllVolunteersState {
  final dynamic error;

  GetAllVolunteersError(this.error);
}

class GetAllVolunteersSuccess extends GetAllVolunteersState {
  final List<VolunteerStudentDto> data;

  GetAllVolunteersSuccess(this.data);
}
