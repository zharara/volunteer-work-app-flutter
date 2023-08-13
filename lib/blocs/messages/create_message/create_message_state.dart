part of 'create_message_cubit.dart';

@immutable
abstract class CreateMessageState {}

class CreateMessageInitial extends CreateMessageState {}

class CreateMessageLoading extends CreateMessageState {}

class CreateMessageSuccess extends CreateMessageState {
  final MessageDto data;

  CreateMessageSuccess(this.data);
}

class CreateMessageError extends CreateMessageState {
  final dynamic error;

  CreateMessageError(this.error);
}
