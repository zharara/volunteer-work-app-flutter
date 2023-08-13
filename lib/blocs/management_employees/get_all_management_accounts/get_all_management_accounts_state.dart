part of 'get_all_management_accounts_cubit.dart';

@immutable
abstract class GetAllManagementAccountsState {}

class GetAllManagementAccountsInitial extends GetAllManagementAccountsState {}

class GetAllManagementAccountsLoading extends GetAllManagementAccountsState {}

class GetAllManagementAccountsEmpty extends GetAllManagementAccountsState {}

class GetAllManagementAccountsError extends GetAllManagementAccountsState {
  final dynamic error;

  GetAllManagementAccountsError(this.error);
}

class GetAllManagementAccountsSuccess extends GetAllManagementAccountsState {
  final List<ManagementEmployeeDto> data;

  GetAllManagementAccountsSuccess(this.data);
}
