import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'get_all_management_accounts_state.dart';

class GetAllManagementAccountsCubit
    extends Cubit<GetAllManagementAccountsState> {
  final ApiClient apiClient;

  GetAllManagementAccountsCubit(this.apiClient)
      : super(GetAllManagementAccountsInitial());

  Future<void> getAllManagementAccounts() async {
    emit(GetAllManagementAccountsLoading());

    try {
      final data = apiClient.handleResponse<List<ManagementEmployeeDto>>(
        await apiClient.api.apiManagementEmployeesGetAllGet(),
      );

      if (data.isEmpty) {
        emit(GetAllManagementAccountsEmpty());
      } else {
        emit(GetAllManagementAccountsSuccess(data));
      }
    } catch (error) {
      emit(GetAllManagementAccountsError(error));
    }
  }

  void updateItemInternally(ManagementEmployeeDto itemDto) {
    if (state is GetAllManagementAccountsSuccess) {
      final data = (state as GetAllManagementAccountsSuccess).data;
      int index = data.indexWhere((e) => e.id == itemDto.id);
      data[index] = itemDto;
      emit(GetAllManagementAccountsSuccess(data));
    }
  }

  void addItemInternally(ManagementEmployeeDto itemDto) {
    List<ManagementEmployeeDto> data = [];

    if (state is GetAllManagementAccountsSuccess) {
      data = (state as GetAllManagementAccountsSuccess).data;
    }

    data.insert(0, itemDto);
    emit(GetAllManagementAccountsSuccess(data));
  }

  void deleteItemInternally(int id) {
    if (state is GetAllManagementAccountsSuccess) {
      final data = (state as GetAllManagementAccountsSuccess).data;
      data.removeWhere((e) => e.id == id);
      emit(GetAllManagementAccountsSuccess(data));
    }
  }
}
