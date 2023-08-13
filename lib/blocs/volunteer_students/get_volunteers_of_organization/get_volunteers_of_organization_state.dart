part of 'get_volunteers_of_organization_cubit.dart';

@immutable
abstract class GetVolunteersOfOrganizationState {}

class GetVolunteersOfOrganizationInitial extends GetVolunteersOfOrganizationState {}

class GetVolunteersOfOrganizationLoading extends GetVolunteersOfOrganizationState {}

class GetVolunteersOfOrganizationEmpty extends GetVolunteersOfOrganizationState {}

class GetVolunteersOfOrganizationError extends GetVolunteersOfOrganizationState {
  final dynamic error;

  GetVolunteersOfOrganizationError(this.error);
}

class GetVolunteersOfOrganizationSuccess extends GetVolunteersOfOrganizationState {
  final List<VolunteerStudentDto> data;

  GetVolunteersOfOrganizationSuccess(this.data);
}
