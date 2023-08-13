import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_volunteer_by_student_id_state.dart';

class GetVolunteerByStudentIdCubit extends Cubit<GetVolunteerByStudentIdState> {
  final ApiClient apiClient;

  GetVolunteerByStudentIdCubit(this.apiClient)
      : super(GetVolunteerByStudentIdInitial());

  void getVolunteer(int studentId) async {
    emit(GetVolunteerByStudentIdLoading());

    try {
      final Response<VolunteerStudentDto> response =
          await apiClient.api.apiVolunteerStudentsGetOfStudentByIdStudentIdGet(
        studentId: studentId,
      );

      if (response.isSuccessful) {
        if (response.body != null) {
          emit(GetVolunteerByStudentIdSuccess(response.body!));
        } else {
          emit(GetVolunteerByStudentIdEmpty());
        }
      } else if (response.statusCode == 204) {
        emit(GetVolunteerByStudentIdEmpty());
      } else {
        if (response.error is ApiError) {
          throw response.error as ApiError;
        }

        throw ApiError(
          errorTitle: 'خطأ في الخادم',
          errorMessage: 'حدث خطأ داخلي في خادم الإنترنت',
        );
      }
    } catch (error) {
      emit(GetVolunteerByStudentIdError(error));
    }
  }
}
