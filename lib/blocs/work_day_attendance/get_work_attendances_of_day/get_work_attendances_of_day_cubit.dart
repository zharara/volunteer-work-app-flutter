import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_work_attendances_of_day_state.dart';

class GetWorkAttendancesOfDayCubit extends Cubit<GetWorkAttendancesOfDayState> {
  final ApiClient apiClient;

  GetWorkAttendancesOfDayCubit(this.apiClient)
      : super(GetWorkAttendancesOfDayInitial());

  Future<void> getWorkAttendancesOfDay(int workDayId) async {
    emit(GetWorkAttendancesOfDayLoading());

    try {
      final data =
          apiClient.handleResponse<List<VolunteerStudentWorkAttendanceDto>>(
              await apiClient.api.apiVolunteerStudentWorkAttendancesGetListGet(
        maxResultCount: 1000000,
        workDayId: workDayId,
      ));

      if (data.isEmpty) {
        emit(GetWorkAttendancesOfDayEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetWorkAttendancesOfDaySuccess(data));
      }
    } catch (error) {
      emit(GetWorkAttendancesOfDayError(error));
    }
  }

  void updateItemInternally(VolunteerStudentWorkAttendanceDto itemDto) {
    if (state is GetWorkAttendancesOfDaySuccess) {
      final data = (state as GetWorkAttendancesOfDaySuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetWorkAttendancesOfDaySuccess(data));
    }
  }

  void addItemInternally(VolunteerStudentWorkAttendanceDto itemDto) {
    List<VolunteerStudentWorkAttendanceDto> data = [];

    if (state is GetWorkAttendancesOfDaySuccess) {
      data = (state as GetWorkAttendancesOfDaySuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetWorkAttendancesOfDaySuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetWorkAttendancesOfDaySuccess) {
      final data = (state as GetWorkAttendancesOfDaySuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetWorkAttendancesOfDaySuccess(data));
    }
  }
}
