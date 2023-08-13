import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'create_internal_program_state.dart';

class CreateInternalProgramCubit extends Cubit<CreateInternalProgramState> {
  final ApiClient apiClient;

  CreateInternalProgramCubit(this.apiClient)
      : super(CreateInternalProgramInitial());

  void createInternalProgram(CreateInternalVolunteerProgramDto body) async {
    emit(CreateInternalProgramLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramDto>(
        await apiClient.api.apiVolunteerProgramsCreateInternalProgramPost(
          body: body,
        ),
      );

      emit(CreateInternalProgramSuccess(data));
    } catch (error) {
      emit(CreateInternalProgramError(error));
    }
  }
}
