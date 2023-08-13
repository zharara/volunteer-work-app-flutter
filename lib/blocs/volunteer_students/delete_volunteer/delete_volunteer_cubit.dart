import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'delete_volunteer_state.dart';

class DeleteVolunteerCubit extends Cubit<DeleteVolunteerState> {
  final ApiClient apiClient;

  DeleteVolunteerCubit(this.apiClient) : super(DeleteVolunteerInitial());

  void resetState(){
    emit(DeleteVolunteerInitial());
  }

 Future<void> deleteVolunteer(int id) async {
    emit(DeleteVolunteerLoading());

    try {
      final data = apiClient.handleResponse<VolunteerStudentDto>(
        await apiClient.api.apiVolunteerStudentsDeleteIdDelete(
          id: id,
        ),
      );

      emit(DeleteVolunteerSuccess(data));
    } catch (error) {
      emit(DeleteVolunteerError(error));
    }
  }
}
