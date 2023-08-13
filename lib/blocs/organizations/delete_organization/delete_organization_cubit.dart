import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'delete_organization_state.dart';

class DeleteOrganizationCubit extends Cubit<DeleteOrganizationState> {
  final ApiClient apiClient;

  DeleteOrganizationCubit(this.apiClient) : super(DeleteOrganizationInitial());
void resetState(){
  emit(DeleteOrganizationInitial());
}
Future<void>  deleteOrganization(int id) async {
    emit(DeleteOrganizationLoading());

    try {
      final data = apiClient.handleResponse(
        await apiClient.api.apiOrganizationsDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteOrganizationSuccess(data));
    } catch (error) {
      emit(DeleteOrganizationError(error));
    }
  }
}
