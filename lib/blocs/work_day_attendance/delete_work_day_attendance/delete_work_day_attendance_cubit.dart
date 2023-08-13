import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'delete_work_day_attendance_state.dart';

class DeleteWorkDayAttendanceCubit extends Cubit<DeleteWorkDayAttendanceState> {
  final ApiClient apiClient;

  DeleteWorkDayAttendanceCubit(this.apiClient)
      : super(DeleteWorkDayAttendanceInitial());

  void resetState() {
    emit(DeleteWorkDayAttendanceInitial());
  }

  Future<void> deleteWorkDayAttendance(
      int workAttendanceId,
      ) async {
    emit(DeleteWorkDayAttendanceLoading());

    try {
      final data = apiClient.handleResponse<VolunteerStudentWorkAttendanceDto>(
        await apiClient.api.apiVolunteerStudentWorkAttendancesDeleteIdDelete(
          id: workAttendanceId,
        ),
      );

      emit(DeleteWorkDayAttendanceSuccess(data));
    } catch (error) {
      emit(DeleteWorkDayAttendanceError(error));
    }
  }}
