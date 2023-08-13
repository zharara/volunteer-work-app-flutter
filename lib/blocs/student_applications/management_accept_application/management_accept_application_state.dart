part of 'management_accept_application_cubit.dart';

@immutable
abstract class ManagementAcceptApplicationState {}

class ManagementAcceptApplicationInitial extends ManagementAcceptApplicationState {}

class ManagementAcceptApplicationLoading
    extends ManagementAcceptApplicationState {}

class ManagementAcceptApplicationSuccess
    extends ManagementAcceptApplicationState {
  final StudentApplicationDto data;

  ManagementAcceptApplicationSuccess(this.data);
}

class ManagementAcceptApplicationError extends ManagementAcceptApplicationState {
  final dynamic error;

  ManagementAcceptApplicationError(this.error);
}