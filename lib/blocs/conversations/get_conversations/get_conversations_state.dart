part of 'get_conversations_cubit.dart';

@immutable
abstract class GetConversationsState {}

class GetConversationsInitial extends GetConversationsState {}

class GetConversationsLoading extends GetConversationsState {}

class GetConversationsError extends GetConversationsState {
  final dynamic error;

  GetConversationsError(this.error);
}

class GetConversationsEmpty extends GetConversationsState {}

class GetConversationsSuccess extends GetConversationsState {
  final List<ConversationDto> data;

  GetConversationsSuccess(this.data);
}