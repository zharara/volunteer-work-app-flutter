import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/main.dart';
import 'package:volunteer_work_app/utils/types.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_home_applications_state.dart';

class GetHomeApplicationsCubit extends Cubit<GetHomeApplicationsState> {
  final ApiClient apiClient;

  GetHomeApplicationsCubit(this.apiClient)
      : super(GetHomeApplicationsInitial());

  void resetState(){
    emit(GetHomeApplicationsInitial());
  }

  Future<void> getHomeApplications(AccountType accountType) async {
    emit(GetHomeApplicationsLoading());

    try {
      final data = apiClient.handleResponse<List<StudentApplicationDto>>(
        await apiClient.api.apiStudentApplicationsGetListGet(
          organizationId: accountType == AccountType.organization
              ? globalAppStorage.getOrganizationAccount()?.id ?? 0
              : null,
          studentId: accountType == AccountType.student
              ? globalAppStorage.getStudentAccount()?.id ?? 0
              : null,
          maxResultCount: 5,
        ),
      );

      if (data.isEmpty) {
        emit(GetHomeApplicationsEmpty());
      } else {
        data.sort((c1, c2) => c2.createdDate!.compareTo(c1.createdDate!));
        emit(GetHomeApplicationsSuccess(data));
      }
    } catch (error) {
      emit(GetHomeApplicationsError(error));
    }
  }

  void updateItemInternally(StudentApplicationDto applicationDto) {
    if (state is GetHomeApplicationsSuccess) {
      final data = (state as GetHomeApplicationsSuccess).data;
      int index = data.indexWhere((e) => e.id == applicationDto.id);
      if (index != -1) {
        data[index] = applicationDto;
        emit(GetHomeApplicationsSuccess(data));
      }
    }
  }

  void deleteItemInternally(int id) {
    if (state is GetHomeApplicationsSuccess) {
      final data = (state as GetHomeApplicationsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetHomeApplicationsSuccess(data));
    }
  }
}
