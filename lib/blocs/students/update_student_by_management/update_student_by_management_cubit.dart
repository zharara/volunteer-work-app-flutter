import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_student_by_management_state.dart';

class UpdateStudentByManagementCubit
    extends Cubit<UpdateStudentByManagementState> {
  final ApiClient apiClient;

  UpdateStudentByManagementCubit(this.apiClient)
      : super(UpdateStudentByManagementInitial());

  Future<void> updateStudentInfo(UpdateStudentByManagementDto body) async {
    emit(UpdateStudentByManagementLoading());

    try {
      final data = apiClient.handleResponse<StudentDto>(
        await apiClient.api.apiStudentsUpdateByManagementPut(
          body: body,
        ),
      );

      emit(UpdateStudentByManagementSuccess(data));
    } catch (error) {
      emit(UpdateStudentByManagementError(error));
    }
  }
}
