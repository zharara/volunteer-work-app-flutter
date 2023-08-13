import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volunteer_work_app/main.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.swagger.dart';
import '../../../utils/types.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiClient apiClient;

  LoginBloc(this.apiClient) : super(LoginInitial()) {

    on<ManagementLoginRequested>((event, emit) async {
      emit(LoginLoading());

      try {
        final data = apiClient.handleResponse<ManagementEmployeeAccount>(
          await apiClient.api.apiAuthLoginManagementPost(
            body: AuthenticateRequest(
              userNameOrEmail: event.usernameOrEmail,
              password: event.password,
              fcmToken: await FirebaseMessaging.instance.getToken(),
            ),
          ),
        );

        await globalAppStorage.setAccessToken(data.authToken?.token ?? '');
        await globalAppStorage
            .setCurrentAccountId(data.managementEmployeeDto?.id ?? 0);
        await globalAppStorage.setAccountType(AccountType.management);
        await globalAppStorage
            .setManagementAccount(data.managementEmployeeDto!);

        emit(LoggedInManagement(data));
      } catch (error) {
        emit(LoginError(error));
      }
    });

    on<OrganizationLoginRequested>((event, emit) async {
      emit(LoginLoading());

      try {
        final data = apiClient.handleResponse<OrganizationAccount>(
          await apiClient.api.apiAuthLoginOrganizationPost(
            body: AuthenticateRequest(
              userNameOrEmail: event.usernameOrEmail,
              password: event.password,
              fcmToken: await FirebaseMessaging.instance.getToken(),
            ),
          ),
        );

        await globalAppStorage.setAccessToken(data.authToken?.token ?? '');
        await globalAppStorage
            .setCurrentAccountId(data.organizationDto?.id ?? 0);
        await globalAppStorage.setAccountType(AccountType.organization);
        await globalAppStorage.setOrganizationAccount(data.organizationDto!);

        emit(LoggedInOrganization(data));
      } catch (error) {
        emit(LoginError(error));
      }
    });

    on<StudentLoginRequested>((event, emit) async {
      emit(LoginLoading());

      try {
        final data = apiClient.handleResponse<StudentAccount>(
          await apiClient.api.apiAuthLoginStudentPost(
            body: AuthenticateRequest(
              userNameOrEmail: event.usernameOrEmail,
              password: event.password,
              fcmToken: await FirebaseMessaging.instance.getToken(),
            ),
          ),
        );

        await globalAppStorage.setAccessToken(data.authToken?.token ?? '');
        await globalAppStorage.setCurrentAccountId(data.studentDto?.id ?? 0);
        await globalAppStorage.setAccountType(AccountType.student);
        await globalAppStorage.setStudentAccount(data.studentDto!);

        emit(LoggedInStudent(data));
      } catch (error) {
        emit(LoginError(error));
      }
    });
  }
}
