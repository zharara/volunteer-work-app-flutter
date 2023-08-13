import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_skills_for_select_state.dart';

class GetSkillsForSelectCubit extends Cubit<GetSkillsForSelectState> {
  final ApiClient apiClient;

  GetSkillsForSelectCubit(this.apiClient) : super(GetSkillsForSelectInitial());

  getSkillsForSelect() async {
    emit(GetSkillsForSelectLoading());

    try {
      final data = apiClient.handleResponse<List<SkillDto>>(
        await apiClient.api.apiSkillsGetListGet(),
      );

      if (data.isEmpty) {
        emit(GetSkillsForSelectEmpty());
      } else {
        emit(GetSkillsForSelectSuccess(data));
      }
    } catch (error) {
      emit(GetSkillsForSelectError(error));
    }
  }
}
