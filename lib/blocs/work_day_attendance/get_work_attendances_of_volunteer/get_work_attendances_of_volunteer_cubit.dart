import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_work_attendances_of_volunteer_state.dart';

class GetWorkAttendancesOfVolunteerCubit
    extends Cubit<GetWorkAttendancesOfVolunteerState> {
  final ApiClient apiClient;

  GetWorkAttendancesOfVolunteerCubit(this.apiClient)
      : super(GetWorkAttendancesOfVolunteerInitial());

  Future<void> getWorkAttendancesOfVolunteer(int volunteerStudentId) async {
    emit(GetWorkAttendancesOfVolunteerLoading());

    try {
      final data =
          apiClient.handleResponse<List<VolunteerStudentWorkAttendanceDto>>(
              await apiClient.api.apiVolunteerStudentWorkAttendancesGetListGet(
        maxResultCount: 1000000,
        volunteerStudentId: volunteerStudentId,
      ));

      if (data.isEmpty) {
        emit(GetWorkAttendancesOfVolunteerEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetWorkAttendancesOfVolunteerSuccess(data));
      }
    } catch (error) {
      emit(GetWorkAttendancesOfVolunteerError(error));
    }
  }

  void updateItemInternally(VolunteerStudentWorkAttendanceDto itemDto) {
    if (state is GetWorkAttendancesOfVolunteerSuccess) {
      final data = (state as GetWorkAttendancesOfVolunteerSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetWorkAttendancesOfVolunteerSuccess(data));
    }
  }

  void addItemInternally(VolunteerStudentWorkAttendanceDto itemDto) {
    List<VolunteerStudentWorkAttendanceDto> data = [];

    if (state is GetWorkAttendancesOfVolunteerSuccess) {
      data = (state as GetWorkAttendancesOfVolunteerSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetWorkAttendancesOfVolunteerSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetWorkAttendancesOfVolunteerSuccess) {
      final data = (state as GetWorkAttendancesOfVolunteerSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetWorkAttendancesOfVolunteerSuccess(data));
    }
  }
}
