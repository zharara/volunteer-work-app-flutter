import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';

part 'management_reset_student_password_state.dart';

class ManagementResetStudentPasswordCubit
    extends Cubit<ManagementResetStudentPasswordState> {
  final ApiClient apiClient;

  ManagementResetStudentPasswordCubit(this.apiClient)
      : super(ManagementResetStudentPasswordInitial());

  Future<void> resetStudentPassword({
    required int studentId,
    required String newPassword,
  }) async {
    emit(ManagementResetStudentPasswordLoading());

    try {
      final data = apiClient.handleResponse<dynamic>(
          await apiClient.api.apiAuthResetStudentPasswordByManagementPost(
        studentId: studentId,
        newPassword: newPassword,
      ));

      emit(ManagementResetStudentPasswordSuccess(data));
    } catch (error) {
      emit(ManagementResetStudentPasswordError(error));
    }
  }
}
