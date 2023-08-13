import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_all_applications_state.dart';

class GetAllApplicationsCubit extends Cubit<GetAllApplicationsState> {
  final ApiClient apiClient;

  GetAllApplicationsCubit(this.apiClient) : super(GetAllApplicationsInitial());

  Future<void> getAllApplications() async {
    emit(GetAllApplicationsLoading());

    try {
      final data = apiClient.handleResponse<List<StudentApplicationDto>>(
          await apiClient.api.apiStudentApplicationsGetListGet(
        maxResultCount: 1000000,
      ));

      if (data.isEmpty) {
        emit(GetAllApplicationsEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetAllApplicationsSuccess(data));
      }
    } catch (error) {
      emit(GetAllApplicationsError(error));
    }
  }

  void updateItemInternally(StudentApplicationDto itemDto) {
    if (state is GetAllApplicationsSuccess) {
      final data = (state as GetAllApplicationsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      if (index != -1) {
        data[index] = itemDto;
        emit(GetAllApplicationsSuccess(data));
      }
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetAllApplicationsSuccess) {
      final data = (state as GetAllApplicationsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetAllApplicationsSuccess(data));
    }
  }
}
