import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_volunteers_of_program_state.dart';

class GetVolunteersOfProgramCubit extends Cubit<GetVolunteersOfProgramState> {
  final ApiClient apiClient;

  GetVolunteersOfProgramCubit(this.apiClient)
      : super(GetVolunteersOfProgramInitial());

  void resetState(){
    emit(GetVolunteersOfProgramInitial());
  }

  Future<void> getVolunteersOfProgram(int volunteerProgramId) async {
    emit(GetVolunteersOfProgramLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerStudentDto>>(
        await apiClient.api.apiVolunteerStudentsGetListGet(
          volunteerProgramId: volunteerProgramId,
        ),
      );

      if (data.isEmpty) {
        emit(GetVolunteersOfProgramEmpty());
      } else {
        emit(GetVolunteersOfProgramSuccess(data));
      }
    } catch (error) {
      emit(GetVolunteersOfProgramError(error));
    }
  }

  void updateItemInternally(VolunteerStudentDto itemDto) {
    if (state is GetVolunteersOfProgramSuccess) {
      final data = (state as GetVolunteersOfProgramSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetVolunteersOfProgramSuccess(data));
    }
  }

  void addItemInternally(VolunteerStudentDto itemDto) {
    List<VolunteerStudentDto> data = [];

    if (state is GetVolunteersOfProgramSuccess) {
      data = (state as GetVolunteersOfProgramSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetVolunteersOfProgramSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetVolunteersOfProgramSuccess) {
      final data = (state as GetVolunteersOfProgramSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetVolunteersOfProgramSuccess(data));
    }
  }
}
