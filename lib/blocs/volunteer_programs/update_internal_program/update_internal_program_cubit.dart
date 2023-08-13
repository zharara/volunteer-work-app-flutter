import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_internal_program_state.dart';

class UpdateInternalProgramCubit extends Cubit<UpdateInternalProgramState> {
  final ApiClient apiClient;

  UpdateInternalProgramCubit(this.apiClient) : super(UpdateInternalProgramInitial());

  void updateInternalProgram(UpdateInternalVolunteerProgramDto body) async {
    emit(UpdateInternalProgramLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramDto>(
        await apiClient.api.apiVolunteerProgramsUpdateInternalProgramPut(
          body: body,
        ),
      );

      emit(UpdateInternalProgramSuccess(data));
    } catch (error) {
      emit(UpdateInternalProgramError(error));
    }
  }}
