part of 'get_all_internal_programs_cubit.dart';

@immutable
abstract class GetAllInternalProgramsState {}

class GetAllInternalProgramsInitial extends GetAllInternalProgramsState {}

class GetAllInternalProgramsLoading extends GetAllInternalProgramsState {}

class GetAllInternalProgramsEmpty extends GetAllInternalProgramsState {}

class GetAllInternalProgramsError extends GetAllInternalProgramsState {
  final dynamic error;

  GetAllInternalProgramsError(this.error);
}

class GetAllInternalProgramsSuccess extends GetAllInternalProgramsState {
  final List<VolunteerProgramDto> data;

  GetAllInternalProgramsSuccess(this.data);
}
