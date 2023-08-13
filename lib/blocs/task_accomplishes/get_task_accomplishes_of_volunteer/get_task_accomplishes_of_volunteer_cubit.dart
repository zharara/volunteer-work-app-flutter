import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_task_accomplishes_of_volunteer_state.dart';

class GetTaskAccomplishesOfVolunteerCubit
    extends Cubit<GetTaskAccomplishesOfVolunteerState> {
  final ApiClient apiClient;

  GetTaskAccomplishesOfVolunteerCubit(this.apiClient)
      : super(GetTaskAccomplishesOfVolunteerInitial());

  Future<void> getTaskAccomplishesOfVolunteer(int volunteerStudentId) async {
    emit(GetTaskAccomplishesOfVolunteerLoading());

    try {
      final data =
          apiClient.handleResponse<List<VolunteerStudentTaskAccomplishDto>>(
              await apiClient.api.apiVolunteerStudentTaskAccomplishesGetListGet(
        maxResultCount: 1000000,
        volunteerStudentId: volunteerStudentId,
      ));

      if (data.isEmpty) {
        emit(GetTaskAccomplishesOfVolunteerEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetTaskAccomplishesOfVolunteerSuccess(data));
      }
    } catch (error) {
      emit(GetTaskAccomplishesOfVolunteerError(error));
    }
  }

  void updateItemInternally(VolunteerStudentTaskAccomplishDto itemDto) {
    if (state is GetTaskAccomplishesOfVolunteerSuccess) {
      final data = (state as GetTaskAccomplishesOfVolunteerSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetTaskAccomplishesOfVolunteerSuccess(data));
    }
  }

  void addItemInternally(VolunteerStudentTaskAccomplishDto itemDto) {
    List<VolunteerStudentTaskAccomplishDto> data = [];

    if (state is GetTaskAccomplishesOfVolunteerSuccess) {
      data = (state as GetTaskAccomplishesOfVolunteerSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetTaskAccomplishesOfVolunteerSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetTaskAccomplishesOfVolunteerSuccess) {
      final data = (state as GetTaskAccomplishesOfVolunteerSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetTaskAccomplishesOfVolunteerSuccess(data));
    }
  }
}
