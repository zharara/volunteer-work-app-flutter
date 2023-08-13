import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'delete_work_day_state.dart';

class DeleteWorkDayCubit extends Cubit<DeleteWorkDayState> {
  final ApiClient apiClient;

  DeleteWorkDayCubit(this.apiClient) : super(DeleteWorkDayInitial());

  void resetState() {
    emit(DeleteWorkDayInitial());
  }

  Future<void> deleteWorkDay(int id) async {
    emit(DeleteWorkDayLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramWorkDayDto>(
        await apiClient.api.apiVolunteerProgramWorkDaysDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteWorkDaySuccess(data));
    } catch (error) {
      emit(DeleteWorkDayError(error));
    }
  }
}
