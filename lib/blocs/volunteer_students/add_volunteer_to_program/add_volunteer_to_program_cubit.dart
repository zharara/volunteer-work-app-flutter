import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'add_volunteer_to_program_state.dart';

class AddVolunteerToProgramCubit extends Cubit<AddVolunteerToProgramState> {
  final ApiClient apiClient;

  AddVolunteerToProgramCubit(this.apiClient)
      : super(AddVolunteerToProgramInitial());

  addVolunteer(CreateVolunteerStudentDto body) async {
    emit(AddVolunteerToProgramLoading());

    try {
      final data = apiClient.handleResponse<VolunteerStudentDto>(
        await apiClient.api.apiVolunteerStudentsCreatePost(
          body: body,
        ),
      );

      emit(AddVolunteerToProgramSuccess(data));
    } catch (error) {
      emit(AddVolunteerToProgramError(error));
    }
  }
}
