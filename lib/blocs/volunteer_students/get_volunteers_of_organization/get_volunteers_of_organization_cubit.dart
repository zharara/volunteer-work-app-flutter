import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_volunteers_of_organization_state.dart';

class GetVolunteersOfOrganizationCubit
    extends Cubit<GetVolunteersOfOrganizationState> {
  final ApiClient apiClient;

  GetVolunteersOfOrganizationCubit(this.apiClient)
      : super(GetVolunteersOfOrganizationInitial());

  Future<void> getVolunteersOfOrganization(int organizationId) async {
    emit(GetVolunteersOfOrganizationLoading());

    try {
      final data = apiClient.handleResponse<List<VolunteerStudentDto>>(
        await apiClient.api.apiVolunteerStudentsGetListGet(
          organizationId: organizationId,
        ),
      );

      if (data.isEmpty) {
        emit(GetVolunteersOfOrganizationEmpty());
      } else {
        emit(GetVolunteersOfOrganizationSuccess(data));
      }
    } catch (error) {
      emit(GetVolunteersOfOrganizationError(error));
    }
  }
}
