import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  final ApiClient apiClient;

  DeleteTaskCubit(this.apiClient) : super(DeleteTaskInitial());

  void resetState(){
    emit(DeleteTaskInitial());
  }

  Future<void> deleteTask(int id) async {
    emit(DeleteTaskLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramTaskDto>(
        await apiClient.api.apiVolunteerProgramTasksDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteTaskSuccess(data));
    } catch (error) {
      emit(DeleteTaskError(error));
    }
  }
}
