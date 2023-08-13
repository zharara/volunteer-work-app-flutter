import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'organization_accept_application_state.dart';

class OrganizationAcceptApplicationCubit
    extends Cubit<OrganizationAcceptApplicationState> {
  final ApiClient apiClient;

  OrganizationAcceptApplicationCubit(this.apiClient)
      : super(OrganizationAcceptApplicationInitial());

  void resetState(){
    emit(OrganizationAcceptApplicationInitial());
  }

  acceptApplication({
    required int id,
  }) async {
    emit(OrganizationAcceptApplicationLoading());

    try {
      final data = apiClient.handleResponse<StudentApplicationDto>(
        await apiClient.api
            .apiStudentApplicationsOrganizationAcceptApplicationIdPut(id: id),
      );

      emit(OrganizationAcceptApplicationSuccess(data));
    } catch (error) {
      emit(OrganizationAcceptApplicationError(error));
    }
  }
}
