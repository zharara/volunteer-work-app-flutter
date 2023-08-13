import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_program_state.dart';

class DeleteProgramCubit extends Cubit<DeleteProgramState> {
  final ApiClient apiClient;

  DeleteProgramCubit(this.apiClient) : super(DeleteProgramInitial());

  void resetState(){
    emit(DeleteProgramInitial());
  }

  deleteProgram(int id) async {
    emit(DeleteProgramLoading());

    try {
      final data = apiClient.handleResponse<VolunteerProgramDto>(
        await apiClient.api.apiVolunteerProgramsDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteProgramSuccess(data));
    } catch (error) {
      emit(DeleteProgramError(error));
    }
  }}
