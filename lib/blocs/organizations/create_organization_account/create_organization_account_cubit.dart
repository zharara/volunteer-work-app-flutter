import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../main.dart';
import '../../../utils/types.dart';

part 'create_organization_account_state.dart';

class CreateOrganizationAccountCubit
    extends Cubit<CreateOrganizationAccountState> {
  final ApiClient apiClient;

  CreateOrganizationAccountCubit(this.apiClient)
      : super(CreateOrganizationAccountInitial());

  createAccount({
    required String username,
    required String password,
    required String orgNameLocal,
    required String fieldOfWork,
    required String about,
    String? email,
    String? phoneNumber,
    String? orgNameForeign,
    String? vision,
    String? mission,
    String? address,
  }) async {
    emit(CreateOrganizationAccountLoading());

    try {
      final data = apiClient.handleResponse(
        await apiClient.api.apiOrganizationsCreatePost(
          body: CreateOrganizationDto(
            userName: username,
            password: password,
            orgNameLocal: orgNameLocal,
            fieldOfWork: fieldOfWork,
            about: about,
            email: email,
            phoneNumber: phoneNumber,
            orgNameForeign: orgNameForeign,
            vision: vision,
            mission: mission,
            address: address,
            fcmToken: await FirebaseMessaging.instance.getToken(),
          ),
        ),
      );
      await globalAppStorage.setAccessToken(data.authToken?.token ?? '');
      await globalAppStorage.setAccountType(AccountType.organization);
      await globalAppStorage.setOrganizationAccount(data.organizationDto!);

      emit(CreateOrganizationAccountSuccess(data));
    } catch (error) {
      emit(CreateOrganizationAccountError(error));
    }
  }
}
