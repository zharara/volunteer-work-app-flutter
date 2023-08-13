import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';

part 'create_management_account_state.dart';

class CreateManagementAccountCubit extends Cubit<CreateManagementAccountState> {
  final ApiClient apiClient;

  CreateManagementAccountCubit(this.apiClient)
      : super(CreateManagementAccountInitial());

  createAccount(CreateManagementEmployeeDto body) async {
    emit(CreateManagementAccountLoading());

    try {
      final data = apiClient.handleResponse<ManagementEmployeeAccount>(
        await apiClient.api.apiManagementEmployeesCreatePost(
          body: body,
        ),
      );

      emit(CreateManagementAccountSuccess(data));
    } catch (error) {
      emit(CreateManagementAccountError(error));
    }
  }
}
