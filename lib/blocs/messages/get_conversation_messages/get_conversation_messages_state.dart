part of 'get_conversation_messages_cubit.dart';

@immutable
abstract class GetConversationMessagesState {}

class GetConversationMessagesInitial extends GetConversationMessagesState {}

class GetConversationMessagesLoading extends GetConversationMessagesState {}

class GetConversationMessagesError extends GetConversationMessagesState {
  final dynamic error;

  GetConversationMessagesError(this.error);
}

class GetConversationMessagesEmpty extends GetConversationMessagesState {}

class GetConversationMessagesSuccess extends GetConversationMessagesState {
  final List<MessageDto> data;

  GetConversationMessagesSuccess(this.data);
}
