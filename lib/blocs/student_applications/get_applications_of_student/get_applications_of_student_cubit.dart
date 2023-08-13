import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_applications_of_student_state.dart';

class GetApplicationsOfStudentCubit
    extends Cubit<GetApplicationsOfStudentState> {
  final ApiClient apiClient;

  GetApplicationsOfStudentCubit(this.apiClient)
      : super(GetApplicationsOfStudentInitial());

  Future<void> getApplicationsOfStudent({required int studentId}) async {
    emit(GetApplicationsOfStudentLoading());

    try {
      final data = apiClient.handleResponse<List<StudentApplicationDto>>(
          await apiClient.api.apiStudentApplicationsGetListGet(
        studentId: studentId,
        maxResultCount: 1000000,
      ));

      if (data.isEmpty) {
        emit(GetApplicationsOfStudentEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetApplicationsOfStudentSuccess(data));
      }
    } catch (error) {
      emit(GetApplicationsOfStudentError(error));
    }
  }

  void updateItemInternally(StudentApplicationDto applicationDto) {
    if (state is GetApplicationsOfStudentSuccess) {
      final data = (state as GetApplicationsOfStudentSuccess).data;
      int index = data.indexWhere((e) => e.id == applicationDto.id);
      data[index] = applicationDto;
      emit(GetApplicationsOfStudentSuccess(data));
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetApplicationsOfStudentSuccess) {
      final data = (state as GetApplicationsOfStudentSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetApplicationsOfStudentSuccess(data));
    }
  }
}
