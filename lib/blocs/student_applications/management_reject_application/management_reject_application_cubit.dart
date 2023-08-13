import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'management_reject_application_state.dart';

class ManagementRejectApplicationCubit
    extends Cubit<ManagementRejectApplicationState> {
  final ApiClient apiClient;

  ManagementRejectApplicationCubit(this.apiClient)
      : super(ManagementRejectApplicationInitial());

  void resetState(){
    emit(ManagementRejectApplicationInitial());
  }

  void rejectApplication({
    required RejectStudentApplication body,
  }) async {
    emit(ManagementRejectApplicationLoading());

    try {
      final data = apiClient.handleResponse<StudentApplicationDto>(
        await apiClient.api
            .apiStudentApplicationsManagementRejectApplicationPut(body: body),
      );

      emit(ManagementRejectApplicationSuccess(data));
    } catch (error) {
      emit(ManagementRejectApplicationError(error));
    }
  }
}
