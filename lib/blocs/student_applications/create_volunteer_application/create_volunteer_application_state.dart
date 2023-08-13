part of 'create_volunteer_application_cubit.dart';

@immutable
abstract class CreateVolunteerApplicationState {}

class CreateVolunteerApplicationInitial
    extends CreateVolunteerApplicationState {}

class CreateVolunteerApplicationLoading
    extends CreateVolunteerApplicationState {}

class CreateVolunteerApplicationSuccess
    extends CreateVolunteerApplicationState {
  final StudentApplicationDto data;

  CreateVolunteerApplicationSuccess(this.data);
}

class CreateVolunteerApplicationError extends CreateVolunteerApplicationState {
  final dynamic error;

  CreateVolunteerApplicationError(this.error);
}
