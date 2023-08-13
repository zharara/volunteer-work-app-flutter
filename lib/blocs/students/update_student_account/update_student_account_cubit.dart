import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'update_student_account_state.dart';

class UpdateStudentAccountCubit extends Cubit<UpdateStudentAccountState> {
  final ApiClient apiClient;

  UpdateStudentAccountCubit(this.apiClient)
      : super(UpdateStudentAccountInitial());

  createAccount(UpdateStudentDto body) async {
    emit(UpdateStudentAccountLoading());

    try {
      final data = apiClient.handleResponse<StudentDto>(
        await apiClient.api.apiStudentsUpdatePut(
          body: body,
        ),
      );

      emit(UpdateStudentAccountSuccess(data));
    } catch (error) {
      emit(UpdateStudentAccountError(error));
    }
  }
}
