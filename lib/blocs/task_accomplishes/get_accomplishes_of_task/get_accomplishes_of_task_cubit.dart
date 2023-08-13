import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_accomplishes_of_task_state.dart';

class GetAccomplishesOfTaskCubit extends Cubit<GetAccomplishesOfTaskState> {
  final ApiClient apiClient;

  GetAccomplishesOfTaskCubit(this.apiClient)
      : super(GetAccomplishesOfTaskInitial());

  Future<void> getAccomplishesOfTask(int taskId) async {
    emit(GetAccomplishesOfTaskLoading());

    try {
      final data =
          apiClient.handleResponse<List<VolunteerStudentTaskAccomplishDto>>(
              await apiClient.api.apiVolunteerStudentTaskAccomplishesGetListGet(
        maxResultCount: 1000000,
        taskId: taskId,
      ));

      if (data.isEmpty) {
        emit(GetAccomplishesOfTaskEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetAccomplishesOfTaskSuccess(data));
      }
    } catch (error) {
      emit(GetAccomplishesOfTaskError(error));
    }
  }

  void updateItemInternally(VolunteerStudentTaskAccomplishDto itemDto) {
    if (state is GetAccomplishesOfTaskSuccess) {
      final data = (state as GetAccomplishesOfTaskSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetAccomplishesOfTaskSuccess(data));
    }
  }

  void addItemInternally(VolunteerStudentTaskAccomplishDto itemDto) {
    List<VolunteerStudentTaskAccomplishDto> data = [];

    if (state is GetAccomplishesOfTaskSuccess) {
      data = (state as GetAccomplishesOfTaskSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetAccomplishesOfTaskSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetAccomplishesOfTaskSuccess) {
      final data = (state as GetAccomplishesOfTaskSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetAccomplishesOfTaskSuccess(data));
    }
  }
}
