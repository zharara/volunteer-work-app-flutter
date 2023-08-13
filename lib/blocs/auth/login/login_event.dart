part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ManagementLoginRequested extends LoginEvent {
  final String usernameOrEmail;
  final String password;

  ManagementLoginRequested(this.usernameOrEmail, this.password);
}

class OrganizationLoginRequested extends LoginEvent {
  final String usernameOrEmail;
  final String password;

  OrganizationLoginRequested(this.usernameOrEmail, this.password);
}

class StudentLoginRequested extends LoginEvent {
  final String usernameOrEmail;
  final String password;

  StudentLoginRequested(this.usernameOrEmail, this.password);
}
