import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_organization_by_id_state.dart';

class GetOrganizationByIdCubit extends Cubit<GetOrganizationByIdState> {
  final ApiClient apiClient;

  GetOrganizationByIdCubit(this.apiClient)
      : super(GetOrganizationByIdInitial());

  Future<void> getOrganizationAccount(int id) async {
    emit(GetOrganizationByIdLoading());

    try {
      final data = apiClient.handleResponse<OrganizationDto>(
        await apiClient.api.apiOrganizationsGetIdGet(id: id),
      );

      emit(GetOrganizationByIdSuccess(data));
    } catch (error) {
      emit(GetOrganizationByIdError(error));
    }
  }
}
