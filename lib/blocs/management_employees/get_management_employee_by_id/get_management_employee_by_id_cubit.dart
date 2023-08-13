import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_management_employee_by_id_state.dart';

class GetManagementEmployeeByIdCubit
    extends Cubit<GetManagementEmployeeByIdState> {
  final ApiClient apiClient;

  GetManagementEmployeeByIdCubit(this.apiClient)
      : super(GetManagementEmployeeByIdInitial());

  Future<void> getManagementAccount(int id) async {
    emit(GetManagementEmployeeByIdLoading());

    try {
      final data = apiClient.handleResponse<ManagementEmployeeDto>(
        await apiClient.api.apiManagementEmployeesGetIdGet(id: id),
      );

      emit(GetManagementEmployeeByIdSuccess(data));
    } catch (error) {
      emit(GetManagementEmployeeByIdError(error));
    }
  }
}
