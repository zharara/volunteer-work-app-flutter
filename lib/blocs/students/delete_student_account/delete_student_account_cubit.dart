import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'delete_student_account_state.dart';

class DeleteStudentAccountCubit extends Cubit<DeleteStudentAccountState> {
  final ApiClient apiClient;

  DeleteStudentAccountCubit(this.apiClient)
      : super(DeleteStudentAccountInitial());

  void resetState() {
    emit(DeleteStudentAccountInitial());
  }

  Future<void> deleteAccount(int id) async {
    emit(DeleteStudentAccountLoading());

    try {
      final data = apiClient.handleResponse<StudentDto>(
        await apiClient.api.apiStudentsDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteStudentAccountSuccess(data));
    } catch (error) {
      emit(DeleteStudentAccountError(error));
    }
  }
}
