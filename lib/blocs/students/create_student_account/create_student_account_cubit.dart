import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'create_student_account_state.dart';

class CreateStudentAccountCubit extends Cubit<CreateStudentAccountState> {
  final ApiClient apiClient;

  CreateStudentAccountCubit(this.apiClient)
      : super(CreateStudentAccountInitial());

  createAccount(CreateStudentDto body) async {
    emit(CreateStudentAccountLoading());

    try {
      final data = apiClient.handleResponse<StudentAccount>(
        await apiClient.api.apiStudentsCreatePost(
          body: body,
        ),
      );

      emit(CreateStudentAccountSuccess(data));
    } catch (error) {
      emit(CreateStudentAccountError(error));
    }
  }
}
