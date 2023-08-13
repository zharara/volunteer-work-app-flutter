import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_not_volunteer_students_state.dart';

class GetNotVolunteerStudentsCubit extends Cubit<GetNotVolunteerStudentsState> {
  final ApiClient apiClient;

  GetNotVolunteerStudentsCubit(this.apiClient)
      : super(GetNotVolunteerStudentsInitial());

  void getNotVolunteerStudents() async {
    emit(GetNotVolunteerStudentsLoading());

    try {
      final data = apiClient.handleResponse<List<StudentDto>>(
        await apiClient.api.apiStudentsGetListGet(
          isNotVolunteer: true,
          maxResultCount: 1000000,
        ),
      );

      if (data.isEmpty) {
        emit(GetNotVolunteerStudentsEmpty());
      } else {
        emit(GetNotVolunteerStudentsSuccess(data));
      }
    } catch (error) {
      emit(GetNotVolunteerStudentsError(error));
    }
  }
}
