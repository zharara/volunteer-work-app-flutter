import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'create_skill_state.dart';

class CreateSkillCubit extends Cubit<CreateSkillState> {
  final ApiClient apiClient;

  CreateSkillCubit(this.apiClient) : super(CreateSkillInitial());

  Future<void> createSkill(CreateSkillDto createSkillDto) async {
    emit(CreateSkillLoading());

    try {
      final data = apiClient.handleResponse<SkillDto>(
          await apiClient.api.apiSkillsCreatePost(body: createSkillDto));

      emit(CreateSkillSuccess(data));
    } catch (error) {
      emit(CreateSkillError(error));
    }
  }
}
