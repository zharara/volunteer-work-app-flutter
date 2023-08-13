import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_message_state.dart';

class DeleteMessageCubit extends Cubit<DeleteMessageState> {
  final ApiClient apiClient;

  DeleteMessageCubit(this.apiClient) : super(DeleteMessageInitial());

  void resetState(){
    emit(DeleteMessageInitial());
  }

  void deleteMessage(int id) async {
    emit(DeleteMessageLoading());

    try {
      final data = apiClient.handleResponse<MessageDto>(
        await apiClient.api.apiMessagesDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteMessageSuccess(data));
    } catch (error) {
      emit(DeleteMessageError(error));
    }
  }
}
