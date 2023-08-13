part of 'management_reject_application_cubit.dart';

@immutable
abstract class ManagementRejectApplicationState {}

class ManagementRejectApplicationInitial extends ManagementRejectApplicationState {}

class ManagementRejectApplicationLoading
    extends ManagementRejectApplicationState {}

class ManagementRejectApplicationSuccess
    extends ManagementRejectApplicationState {
  final StudentApplicationDto data;

  ManagementRejectApplicationSuccess(this.data);
}

class ManagementRejectApplicationError extends ManagementRejectApplicationState {
  final dynamic error;

  ManagementRejectApplicationError(this.error);
}