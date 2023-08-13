import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_student_by_id_state.dart';

class GetStudentByIdCubit extends Cubit<GetStudentByIdState> {
  final ApiClient apiClient;

  GetStudentByIdCubit(this.apiClient) : super(GetStudentByIdInitial());

  Future<void> getStudentAccount(int id) async {
    emit(GetStudentByIdLoading());

    try {
      final data = apiClient.handleResponse<StudentDto>(
        await apiClient.api.apiStudentsGetIdGet(id: id),
      );

      emit(GetStudentByIdSuccess(data));
    } catch (error) {
      emit(GetStudentByIdError(error));
    }
  }
}
