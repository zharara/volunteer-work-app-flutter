import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_applications_for_organization_state.dart';

class GetApplicationsForOrganizationCubit
    extends Cubit<GetApplicationsForOrganizationState> {
  final ApiClient apiClient;

  GetApplicationsForOrganizationCubit(this.apiClient)
      : super(GetApplicationsForOrganizationInitial());

  Future<void> getApplicationsForOrganization(
      {required int organizationId}) async {
    emit(GetApplicationsForOrganizationLoading());

    try {
      final data = apiClient.handleResponse<List<StudentApplicationDto>>(
          await apiClient.api.apiStudentApplicationsGetListGet(
        organizationId: organizationId,
        maxResultCount: 1000000,
      ));

      if (data.isEmpty) {
        emit(GetApplicationsForOrganizationEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetApplicationsForOrganizationSuccess(data));
      }
    } catch (error) {
      emit(GetApplicationsForOrganizationError(error));
    }
  }

  void updateItemInternally(StudentApplicationDto applicationDto) {
    if (state is GetApplicationsForOrganizationSuccess) {
      final data = (state as GetApplicationsForOrganizationSuccess).data;
      int index = data.indexWhere((e) => e.id == applicationDto.id);

      if (index != -1) {
        data[index] = applicationDto;
        emit(GetApplicationsForOrganizationSuccess(data));
      }
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetApplicationsForOrganizationSuccess) {
      final data = (state as GetApplicationsForOrganizationSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetApplicationsForOrganizationSuccess(data));
    }
  }
}
