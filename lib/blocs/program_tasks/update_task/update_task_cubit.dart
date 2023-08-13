import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  final ApiClient apiClient;

  UpdateTaskCubit(this.apiClient) : super(UpdateTaskInitial());

  Future<void> updateTask(UpdateVolunteerProgramTaskDto body) async {
    emit(UpdateTaskLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramTaskDto>(
        await apiClient.api.apiVolunteerProgramTasksUpdatePost(
          body: body,
        ),
      );

      emit(UpdateTaskSuccess(data));
    } catch (error) {
      emit(UpdateTaskError(error));
    }
  }
}
