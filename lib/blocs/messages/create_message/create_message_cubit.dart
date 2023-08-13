import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'create_message_state.dart';

class CreateMessageCubit extends Cubit<CreateMessageState> {
  final ApiClient apiClient;

  CreateMessageCubit(this.apiClient) : super(CreateMessageInitial());

  void resetState(){
    emit(CreateMessageInitial());
  }
  Future<void> createMessage(CreateMessageDto body) async {
    emit(CreateMessageLoading());

    try {
      final data = apiClient.handleResponse<MessageDto>(
        await apiClient.api.apiMessagesCreatePost(
          body: body,
        ),
      );

      emit(CreateMessageSuccess(data));
    } catch (error) {
      emit(CreateMessageError(error));
    }
  }
}
