import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'create_program_state.dart';

class CreateProgramCubit extends Cubit<CreateProgramState> {
  final ApiClient apiClient;

  CreateProgramCubit(this.apiClient) : super(CreateProgramInitial());

  void createProgram(CreateVolunteerProgramDto body) async {
    emit(CreateProgramLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramDto>(
        await apiClient.api.apiVolunteerProgramsCreateOrganizationProgramPost(
          body: body,
        ),
      );

      emit(CreateProgramSuccess(data));
    } catch (error) {
      emit(CreateProgramError(error));
    }
  }
}
