part of 'create_management_account_cubit.dart';

@immutable
abstract class CreateManagementAccountState {}

class CreateManagementAccountInitial extends CreateManagementAccountState {}

class CreateManagementAccountLoading extends CreateManagementAccountState {}

class CreateManagementAccountSuccess extends CreateManagementAccountState {
  final ManagementEmployeeAccount data;

  CreateManagementAccountSuccess(this.data);
}

class CreateManagementAccountError extends CreateManagementAccountState {
  final dynamic error;

  CreateManagementAccountError(this.error);
}
