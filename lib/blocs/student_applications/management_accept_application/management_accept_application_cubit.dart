import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'management_accept_application_state.dart';

class ManagementAcceptApplicationCubit
    extends Cubit<ManagementAcceptApplicationState> {
  final ApiClient apiClient;

  ManagementAcceptApplicationCubit(this.apiClient)
      : super(ManagementAcceptApplicationInitial());


  void resetState(){
    emit(ManagementAcceptApplicationInitial());
  }

 Future<void> acceptApplication({
    required int id,
  }) async {
    emit(ManagementAcceptApplicationLoading());

    try {
      final data = apiClient.handleResponse<StudentApplicationDto>(
        await apiClient.api
            .apiStudentApplicationsManagementAcceptApplicationIdPut(id: id),
      );

      emit(ManagementAcceptApplicationSuccess(data));
    } catch (error) {
      emit(ManagementAcceptApplicationError(error));
    }
  }
}
