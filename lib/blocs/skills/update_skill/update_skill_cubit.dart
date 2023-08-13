import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_skill_state.dart';

class UpdateSkillCubit extends Cubit<UpdateSkillState> {
  final ApiClient apiClient;

  UpdateSkillCubit(this.apiClient) : super(UpdateSkillInitial());

  Future<void> updateSkill(UpdateSkillDto body) async {
    emit(UpdateSkillLoading());

    try {
      final data = apiClient.handleResponse<SkillDto>(
          await apiClient.api.apiSkillsUpdatePut(body: body));

      emit(UpdateSkillSuccess(data));
    } catch (error) {
      emit(UpdateSkillError(error));
    }
  }
}
