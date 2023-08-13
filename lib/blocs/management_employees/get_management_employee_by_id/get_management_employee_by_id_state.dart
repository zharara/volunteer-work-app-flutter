part of 'get_management_employee_by_id_cubit.dart';

@immutable
abstract class GetManagementEmployeeByIdState {}

class GetManagementEmployeeByIdInitial extends GetManagementEmployeeByIdState {}

class GetManagementEmployeeByIdLoading extends GetManagementEmployeeByIdState {}

class GetManagementEmployeeByIdSuccess extends GetManagementEmployeeByIdState {
  final ManagementEmployeeDto data;

  GetManagementEmployeeByIdSuccess(this.data);
}

class GetManagementEmployeeByIdError extends GetManagementEmployeeByIdState {
  final dynamic error;

  GetManagementEmployeeByIdError(this.error);
}
