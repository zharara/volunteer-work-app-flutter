part of 'get_all_organizations_programs_cubit.dart';

@immutable
abstract class GetAllOrganizationsProgramsState {}

class GetAllOrganizationsProgramsInitial extends GetAllOrganizationsProgramsState {}

class GetAllOrganizationsProgramsLoading extends GetAllOrganizationsProgramsState {}

class GetAllOrganizationsProgramsEmpty extends GetAllOrganizationsProgramsState {}

class GetAllOrganizationsProgramsError extends GetAllOrganizationsProgramsState {
  final dynamic error;

  GetAllOrganizationsProgramsError(this.error);
}

class GetAllOrganizationsProgramsSuccess extends GetAllOrganizationsProgramsState {
  final List<VolunteerProgramDto> data;

  GetAllOrganizationsProgramsSuccess(this.data);
}
