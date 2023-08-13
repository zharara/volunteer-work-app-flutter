import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'organization_reject_application_state.dart';

class OrganizationRejectApplicationCubit
    extends Cubit<OrganizationRejectApplicationState> {
  final ApiClient apiClient;

  OrganizationRejectApplicationCubit(this.apiClient)
      : super(OrganizationRejectApplicationInitial());

  void resetState(){
    emit(OrganizationRejectApplicationInitial());
  }

  void rejectApplication({
    required RejectStudentApplication body,
  }) async {
    emit(OrganizationRejectApplicationLoading());

    try {
      final data = apiClient.handleResponse<StudentApplicationDto>(
        await apiClient.api
            .apiStudentApplicationsOrganizationRejectApplicationPut(body: body),
      );

      emit(OrganizationRejectApplicationSuccess(data));
    } catch (error) {
      emit(OrganizationRejectApplicationError(error));
    }
  }
}
