import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'change_work_day_attendance_state.dart';

class ChangeWorkDayAttendanceCubit extends Cubit<ChangeWorkDayAttendanceState> {
  final ApiClient apiClient;

  ChangeWorkDayAttendanceCubit(this.apiClient)
      : super(ChangeWorkDayAttendanceInitial());

  void resetState() {
    emit(ChangeWorkDayAttendanceInitial());
  }

  Future<void> changeWorkDayAttendance({
    int? volunteerStudentId,
    int? workDayId,
    VolunteerStudentWorkAttendanceDto? workAttendanceDto,
  }) async {
    emit(ChangeWorkDayAttendanceLoading());

    try {
      if (workAttendanceDto != null) {
        final data =
            apiClient.handleResponse<VolunteerStudentWorkAttendanceDto>(
          await apiClient.api.apiVolunteerStudentWorkAttendancesUpdatePost(
            body: UpdateVolunteerStudentWorkAttendanceDto(
              id: workAttendanceDto.id ?? 0,
              isAttended: true,
            ),
          ),
        );

        emit(ChangeWorkDayAttendanceSuccess(data));
      } else {
        final data =
            apiClient.handleResponse<VolunteerStudentWorkAttendanceDto>(
          await apiClient.api.apiVolunteerStudentWorkAttendancesCreatePost(
            body: CreateVolunteerStudentWorkAttendanceDto(
              isAttended: true,
              volunteerStudentId: volunteerStudentId ?? 0,
              volunteerProgramWorkDayId: workDayId ?? 0,
            ),
          ),
        );

        emit(ChangeWorkDayAttendanceSuccess(data));
      }
    } catch (error) {
      emit(ChangeWorkDayAttendanceError(error));
    }
  }
}
