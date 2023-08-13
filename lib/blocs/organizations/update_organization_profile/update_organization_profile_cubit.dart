import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_organization_profile_state.dart';

class UpdateOrganizationProfileCubit
    extends Cubit<UpdateOrganizationProfileState> {
  final ApiClient apiClient;

  UpdateOrganizationProfileCubit(this.apiClient)
      : super(UpdateOrganizationProfileInitial());

  updateOrganization(UpdateOrganizationDto body) async {
    emit(UpdateOrganizationProfileLoading());

    try {
      final data = apiClient.handleResponse(
        await apiClient.api.apiOrganizationsUpdatePut(
          body: body,
        ),
      );

      emit(UpdateOrganizationProfileSuccess(data));
    } catch (error) {
      emit(UpdateOrganizationProfileError(error));
    }
  }
}
