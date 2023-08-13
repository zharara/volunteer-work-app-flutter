import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'update_work_day_state.dart';

class UpdateWorkDayCubit extends Cubit<UpdateWorkDayState> {
  final ApiClient apiClient;

  UpdateWorkDayCubit(this.apiClient) : super(UpdateWorkDayInitial());

  Future<void> updateWorkDay(UpdateVolunteerProgramWorkDayDto body) async {
    emit(UpdateWorkDayLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramWorkDayDto>(
        await apiClient.api.apiVolunteerProgramWorkDaysUpdatePost(
          body: body,
        ),
      );

      emit(UpdateWorkDaySuccess(data));
    } catch (error) {
      emit(UpdateWorkDayError(error));
    }
  }
}
