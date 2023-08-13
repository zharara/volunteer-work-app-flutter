import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ApiClient apiClient;

  ResetPasswordCubit(this.apiClient) : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required String currentUserPassword,
    required String newUserPassword,
  }) async {
    emit(ResetPasswordLoading());

    try {
      final data = apiClient.handleResponse<AuthToken>(
          await apiClient.api.apiAuthChangePasswordPost(
        currentUserPassword: currentUserPassword,
        newUserPassword: newUserPassword,
      ));

      emit(ResetPasswordSuccess(data));
    } catch (error) {
      emit(ResetPasswordError(error));
    }
  }
}
