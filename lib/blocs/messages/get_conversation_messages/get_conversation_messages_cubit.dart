import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_conversation_messages_state.dart';

class GetConversationMessagesCubit extends Cubit<GetConversationMessagesState> {
  final ApiClient apiClient;

  GetConversationMessagesCubit(this.apiClient)
      : super(GetConversationMessagesInitial());

  Future<void> getConversationMessages({
    int? skipCount,
    int? maxResultCount,
    int? conversationId,
  }) async {
    emit(GetConversationMessagesLoading());

    try {
      final data = apiClient.handleResponse<List<MessageDto>>(
          await apiClient.api.apiMessagesGetListGet(
        skipCount: skipCount,
        maxResultCount: maxResultCount,
        conversationId: conversationId,
      ));

      if (data.isEmpty) {
        emit(GetConversationMessagesEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetConversationMessagesSuccess(data));
      }
    } catch (error) {
      emit(GetConversationMessagesError(error));
    }
  }

  Future<void> loadMore({
    int? maxResultCount,
    int? conversationId,
  }) async {
    List<MessageDto> currentData = [];

    if (state is GetConversationMessagesSuccess) {
      currentData = (state as GetConversationMessagesSuccess).data;
    }

    try {
      final data = apiClient.handleResponse<List<MessageDto>>(
          await apiClient.api.apiMessagesGetListGet(
        skipCount: currentData.length,
        maxResultCount: maxResultCount,
        conversationId: conversationId,
      ));

      if (data.isNotEmpty) {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        currentData.addAll(data);
        emit(GetConversationMessagesSuccess(currentData));
      }
    } catch (error) {
      // no action
    }
  }

  void updateItemInternally(MessageDto itemDto) {
    if (state is GetConversationMessagesSuccess) {
      final data = (state as GetConversationMessagesSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetConversationMessagesSuccess(data));
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetConversationMessagesSuccess) {
      final data = (state as GetConversationMessagesSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetConversationMessagesSuccess(data));
    }
  }
}
