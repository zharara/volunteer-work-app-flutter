part of 'get_organization_programs_cubit.dart';

@immutable
abstract class GetOrganizationProgramsState {}

class GetOrganizationProgramsInitial extends GetOrganizationProgramsState {}

class GetOrganizationProgramsLoading extends GetOrganizationProgramsState {}

class GetOrganizationProgramsEmpty extends GetOrganizationProgramsState {}

class GetOrganizationProgramsError extends GetOrganizationProgramsState {
  final dynamic error;

  GetOrganizationProgramsError(this.error);
}

class GetOrganizationProgramsSuccess extends GetOrganizationProgramsState {
  final List<VolunteerProgramDto> data;

  GetOrganizationProgramsSuccess(this.data);
}
