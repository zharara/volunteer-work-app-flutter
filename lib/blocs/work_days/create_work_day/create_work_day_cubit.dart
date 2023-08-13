import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'create_work_day_state.dart';

class CreateWorkDayCubit extends Cubit<CreateWorkDayState> {
  final ApiClient apiClient;

  CreateWorkDayCubit(this.apiClient) : super(CreateWorkDayInitial());

  Future<void> createWorkDay(CreateVolunteerProgramWorkDayDto body) async {
    emit(CreateWorkDayLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramWorkDayDto>(
        await apiClient.api.apiVolunteerProgramWorkDaysCreatePost(
          body: body,
        ),
      );

      emit(CreateWorkDaySuccess(data));
    } catch (error) {
      emit(CreateWorkDayError(error));
    }
  }
}
