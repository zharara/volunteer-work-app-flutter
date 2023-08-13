import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_tasks_of_program_state.dart';

class GetTasksOfProgramCubit extends Cubit<GetTasksOfProgramState> {
  final ApiClient apiClient;

  GetTasksOfProgramCubit(this.apiClient) : super(GetTasksOfProgramInitial());

  void resetState(){
    emit(GetTasksOfProgramInitial());
  }

  Future<void> getTasksOfProgram({required int programId}) async {
    emit(GetTasksOfProgramLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerProgramTaskDto>>(
          await apiClient.api.apiVolunteerProgramTasksGetListGet(
        volunteerProgramId: programId,
        maxResultCount: 100000,
      ));

      if (data.isEmpty) {
        emit(GetTasksOfProgramEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetTasksOfProgramSuccess(data));
      }
    } catch (error) {
      emit(GetTasksOfProgramError(error));
    }
  }

  void updateItemInternally(VolunteerProgramTaskDto itemDto) {
    if (state is GetTasksOfProgramSuccess) {
      final data = (state as GetTasksOfProgramSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetTasksOfProgramSuccess(data));
    }
  }

  void addItemInternally(VolunteerProgramTaskDto itemDto) {
    List<VolunteerProgramTaskDto> data = [];

    if (state is GetTasksOfProgramSuccess) {
      data = (state as GetTasksOfProgramSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetTasksOfProgramSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetTasksOfProgramSuccess) {
      final data = (state as GetTasksOfProgramSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetTasksOfProgramSuccess(data));
    }
  }
}
