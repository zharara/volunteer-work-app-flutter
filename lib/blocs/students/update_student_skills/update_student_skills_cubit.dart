import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_student_skills_state.dart';

class UpdateStudentSkillsCubit extends Cubit<UpdateStudentSkillsState> {
  final ApiClient apiClient;

  UpdateStudentSkillsCubit(this.apiClient)
      : super(UpdateStudentSkillsInitial());

  updateSkills(UpdateStudentSkills body) async {
    emit(UpdateStudentSkillsLoading());

    try {
      final data = apiClient.handleResponse<StudentDto>(
        await apiClient.api.apiStudentsUpdateSkillsPut(
          body: body,
        ),
      );

      emit(UpdateStudentSkillsSuccess(data));
    } catch (error) {
      emit(UpdateStudentSkillsError(error));
    }
  }
}
