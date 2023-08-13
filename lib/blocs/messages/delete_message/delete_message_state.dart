part of 'delete_message_cubit.dart';

@immutable
abstract class DeleteMessageState {}

class DeleteMessageInitial extends DeleteMessageState {}

class DeleteMessageLoading extends DeleteMessageState {}

class DeleteMessageSuccess extends DeleteMessageState {
  final MessageDto data;

  DeleteMessageSuccess(this.data);
}

class DeleteMessageError extends DeleteMessageState {
  final dynamic error;

  DeleteMessageError(this.error);
}
