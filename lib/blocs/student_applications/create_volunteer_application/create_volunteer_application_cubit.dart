
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../main.dart';

part 'create_volunteer_application_state.dart';

class CreateVolunteerApplicationCubit
    extends Cubit<CreateVolunteerApplicationState> {
  final ApiClient apiClient;

  CreateVolunteerApplicationCubit(this.apiClient)
      : super(CreateVolunteerApplicationInitial());

  applyFor({
    required int volunteerOpportunityId,
    String? textInformation,
    SaveTempFile? saveTempFile,
  }) async {
    emit(CreateVolunteerApplicationLoading());

    try {
      final data = apiClient.handleResponse<StudentApplicationDto>(
        await apiClient.api.apiStudentApplicationsCreatePost(
          body: CreateStudentApplicationDto(
            studentId: globalAppStorage.getStudentAccount()?.id ?? 0,
            volunteerOpportunityId: volunteerOpportunityId,
            textInformation: textInformation,
            saveTempFile: saveTempFile,
          ),
        ),
      );

      emit(CreateVolunteerApplicationSuccess(data));
    } catch (error) {
      emit(CreateVolunteerApplicationError(error));
    }
  }
}
