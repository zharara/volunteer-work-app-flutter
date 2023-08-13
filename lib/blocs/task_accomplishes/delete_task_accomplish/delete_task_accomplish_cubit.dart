import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_task_accomplish_state.dart';

class DeleteTaskAccomplishCubit extends Cubit<DeleteTaskAccomplishState> {
  final ApiClient apiClient;

  DeleteTaskAccomplishCubit(this.apiClient)
      : super(DeleteTaskAccomplishInitial());

  void resetState() {
    emit(DeleteTaskAccomplishInitial());
  }

  Future<void> deleteTaskAccomplish(
    int taskAccomplishId,
  ) async {
    emit(DeleteTaskAccomplishLoading());

    try {
      final data = apiClient.handleResponse<VolunteerStudentTaskAccomplishDto>(
        await apiClient.api.apiVolunteerStudentTaskAccomplishesDeleteIdDelete(
          id: taskAccomplishId,
        ),
      );

      emit(DeleteTaskAccomplishSuccess(data));
    } catch (error) {
      emit(DeleteTaskAccomplishError(error));
    }
  }
}
