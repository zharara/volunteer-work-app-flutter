part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final dynamic error;

  ResetPasswordError(this.error);
}

class ResetPasswordSuccess extends ResetPasswordState {
  final AuthToken data;

  ResetPasswordSuccess(this.data);
}
