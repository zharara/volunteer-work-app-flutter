import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'change_task_accomplish_state.dart';

class ChangeTaskAccomplishCubit extends Cubit<ChangeTaskAccomplishState> {
  final ApiClient apiClient;

  ChangeTaskAccomplishCubit(this.apiClient)
      : super(ChangeTaskAccomplishInitial());

  void resetState() {
    emit(ChangeTaskAccomplishInitial());
  }

  Future<void> changeTaskAccomplish({
    int? volunteerStudentId,
    int? taskId,
    VolunteerStudentTaskAccomplishDto? taskAccomplishDto,
    bool? isAccomplished,
    required double? rate,
  }) async {
    emit(ChangeTaskAccomplishLoading());

    try {
      if (taskAccomplishDto != null) {
        final data =
            apiClient.handleResponse<VolunteerStudentTaskAccomplishDto>(
          await apiClient.api.apiVolunteerStudentTaskAccomplishesUpdatePost(
            body: UpdateVolunteerStudentTaskAccomplishDto(
              id: taskAccomplishDto.id ?? 0,
              isAccomplished: isAccomplished ?? false,
              rate: isAccomplished == false ? 0 : rate,
            ),
          ),
        );

        emit(ChangeTaskAccomplishSuccess(data));
      } else {
        final data =
            apiClient.handleResponse<VolunteerStudentTaskAccomplishDto>(
          await apiClient.api.apiVolunteerStudentTaskAccomplishesCreatePost(
            body: CreateVolunteerStudentTaskAccomplishDto(
              isAccomplished: isAccomplished ?? false,
              rate: rate ?? 0,
              volunteerStudentId: volunteerStudentId ?? 0,
              volunteerProgramTaskId: taskId ?? 0,
            ),
          ),
        );

        emit(ChangeTaskAccomplishSuccess(data));
      }
    } catch (error) {
      emit(ChangeTaskAccomplishError(error));
    }
  }
}
