import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final ApiClient apiClient;

  CreateTaskCubit(this.apiClient) : super(CreateTaskInitial());

  Future<void> createTask(CreateVolunteerProgramTaskDto body) async {
    emit(CreateTaskLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramTaskDto>(
        await apiClient.api.apiVolunteerProgramTasksCreatePost(
          body: body,
        ),
      );

      emit(CreateTaskSuccess(data));
    } catch (error) {
      emit(CreateTaskError(error));
    }
  }
}
