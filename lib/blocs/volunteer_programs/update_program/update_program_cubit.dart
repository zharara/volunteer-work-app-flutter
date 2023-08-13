import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_program_state.dart';

class UpdateProgramCubit extends Cubit<UpdateProgramState> {
  final ApiClient apiClient;

  UpdateProgramCubit(this.apiClient) : super(UpdateProgramInitial());

  void updateProgram(UpdateVolunteerProgramDto body) async {
    emit(UpdateProgramLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramDto>(
        await apiClient.api.apiVolunteerProgramsUpdateOrganizationProgramPut(
          body: body,
        ),
      );

      emit(UpdateProgramSuccess(data));
    } catch (error) {
      emit(UpdateProgramError(error));
    }
  }}
