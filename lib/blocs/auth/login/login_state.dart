part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final dynamic error;

  LoginError(this.error);
}

class LoggedInManagement extends LoginState {
  final ManagementEmployeeAccount data;

  LoggedInManagement(this.data);
}

class LoggedInOrganization extends LoginState {
  final OrganizationAccount data;

  LoggedInOrganization(this.data);
}

class LoggedInStudent extends LoginState {
  final StudentAccount data;

  LoggedInStudent(this.data);
}

class LoggedOut extends LoginState {}
