import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_all_volunteers_state.dart';

class GetAllVolunteersCubit extends Cubit<GetAllVolunteersState> {
  final ApiClient apiClient;

  GetAllVolunteersCubit(this.apiClient) : super(GetAllVolunteersInitial());

  void getAllVolunteers() async {
    emit(GetAllVolunteersLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerStudentDto>>(
        await apiClient.api.apiVolunteerStudentsGetAllGet(),
      );

      if (data.isEmpty) {
        emit(GetAllVolunteersEmpty());
      } else {
        emit(GetAllVolunteersSuccess(data));
      }
    } catch (error) {
      emit(GetAllVolunteersError(error));
    }
  }
}
