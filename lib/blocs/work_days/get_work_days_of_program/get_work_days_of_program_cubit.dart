import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_work_days_of_program_state.dart';

class GetWorkDaysOfProgramCubit extends Cubit<GetWorkDaysOfProgramState> {
  final ApiClient apiClient;

  GetWorkDaysOfProgramCubit(this.apiClient)
      : super(GetWorkDaysOfProgramInitial());

  void resetState(){
    emit(GetWorkDaysOfProgramInitial());
  }

  Future<void> getWorkDaysOfProgram(int volunteerProgramId) async {
    emit(GetWorkDaysOfProgramLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerProgramWorkDayDto>>(
        await apiClient.api.apiVolunteerProgramWorkDaysGetListGet(
          volunteerProgramId: volunteerProgramId,
        ),
      );

      if (data.isEmpty) {
        emit(GetWorkDaysOfProgramEmpty());
      } else {
        emit(GetWorkDaysOfProgramSuccess(data));
      }
    } catch (error) {
      emit(GetWorkDaysOfProgramError(error));
    }
  }

  void updateItemInternally(VolunteerProgramWorkDayDto itemDto) {
    if (state is GetWorkDaysOfProgramSuccess) {
      final data = (state as GetWorkDaysOfProgramSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetWorkDaysOfProgramSuccess(data));
    }
  }

  void addItemInternally(VolunteerProgramWorkDayDto itemDto) {
    List<VolunteerProgramWorkDayDto> data = [];

    if (state is GetWorkDaysOfProgramSuccess) {
      data = (state as GetWorkDaysOfProgramSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetWorkDaysOfProgramSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetWorkDaysOfProgramSuccess) {
      final data = (state as GetWorkDaysOfProgramSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetWorkDaysOfProgramSuccess(data));
    }
  }
}
