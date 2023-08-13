import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_student_application_state.dart';

class UpdateStudentApplicationCubit
    extends Cubit<UpdateStudentApplicationState> {
  final ApiClient apiClient;

  UpdateStudentApplicationCubit(this.apiClient)
      : super(UpdateStudentApplicationInitial());

  updateApplication(UpdateStudentApplicationDto body) async {
    emit(UpdateStudentApplicationLoading());

    try {
      final data = apiClient.handleResponse<StudentApplicationDto>(
        await apiClient.api.apiStudentApplicationsUpdatePut(
          body: body,
        ),
      );

      emit(UpdateStudentApplicationSuccess(data));
    } catch (error) {
      emit(UpdateStudentApplicationError(error));
    }
  }
}
