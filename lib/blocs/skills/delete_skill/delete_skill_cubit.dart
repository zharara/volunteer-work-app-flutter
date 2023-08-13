import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_skill_state.dart';

class DeleteSkillCubit extends Cubit<DeleteSkillState> {
  final ApiClient apiClient;

  DeleteSkillCubit(this.apiClient) : super(DeleteSkillInitial());

  void resetState(){
    emit(DeleteSkillInitial());
  }

  Future<void> deleteSkill(int id) async {
    emit(DeleteSkillLoading());

    try {
      final data = apiClient.handleResponse<SkillDto>(
          await apiClient.api.apiSkillsDeleteIdDelete(id: id));

      emit(DeleteSkillSuccess(data));
    } catch (error) {
      emit(DeleteSkillError(error));
    }
  }
}
