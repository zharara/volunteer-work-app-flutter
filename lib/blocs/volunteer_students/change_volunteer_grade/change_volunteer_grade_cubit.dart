import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'change_volunteer_grade_state.dart';

class ChangeVolunteerGradeCubit extends Cubit<ChangeVolunteerGradeState> {
  final ApiClient apiClient;

  ChangeVolunteerGradeCubit(this.apiClient)
      : super(ChangeVolunteerGradeInitial());

  void resetState() {
    emit(ChangeVolunteerGradeInitial());
  }

  Future<void> changeVolunteerGrade({
    required int volunteerStudentId,
    double? orgAssessmentGrade,
    String? orgAssessmentGradeNotes,
    double? finalGrade,
    String? finalGradeNotes,
  }) async {
    emit(ChangeVolunteerGradeLoading());

    try {
      if (orgAssessmentGrade != null) {
        final data = apiClient.handleResponse<VolunteerStudentDto>(
          await apiClient.api
              .apiVolunteerStudentsUpdateOrganizationAssessmentPost(
            body: UpdateVolunteerStudentOrgAssessmentDto(
              id: volunteerStudentId,
              orgAssessmentGrade: orgAssessmentGrade,
              orgAssessmentGradeNotes: orgAssessmentGradeNotes,
            ),
          ),
        );

        emit(ChangeVolunteerGradeSuccess(data));
      } else {
        final data = apiClient.handleResponse<VolunteerStudentDto>(
          await apiClient.api
              .apiVolunteerStudentsUpdateManagementFinalEvaluationPost(
            body: UpdateVolunteerStudentFinalEvaluationDto(
              id: volunteerStudentId,
              finalGrade: finalGrade,
              finalGradeNotes: finalGradeNotes,
            ),
          ),
        );

        emit(ChangeVolunteerGradeSuccess(data));
      }
    } catch (error) {
      emit(ChangeVolunteerGradeError(error));
    }
  }
}
