import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_conversations_state.dart';

class GetConversationsCubit extends Cubit<GetConversationsState> {
  final ApiClient apiClient;

  GetConversationsCubit(this.apiClient) : super(GetConversationsInitial());

  Future<void> getConversations() async {
    emit(GetConversationsLoading());

    try {
      final data = apiClient.handleResponse<List<ConversationDto>>(
          await apiClient.api.apiConversationsGetListGet(
        maxResultCount: 1000000,
      ));

      if (data.isEmpty) {
        emit(GetConversationsEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetConversationsSuccess(data));
      }
    } catch (error) {
      emit(GetConversationsError(error));
    }
  }

  void updateItemInternally(ConversationDto itemDto) {
    if (state is GetConversationsSuccess) {
      final data = (state as GetConversationsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetConversationsSuccess(data));
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetConversationsSuccess) {
      final data = (state as GetConversationsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetConversationsSuccess(data));
    }
  }
}
