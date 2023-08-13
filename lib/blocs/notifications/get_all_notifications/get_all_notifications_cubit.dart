

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/api_generated_code/api.models.swagger.dart';

part 'get_all_notifications_state.dart';

class GetAllNotificationsCubit extends Cubit<GetAllNotificationsState> {
  final ApiClient apiClient;

  GetAllNotificationsCubit(this.apiClient)
      : super(GetAllNotificationsInitial());

  getAllNotifications() async {
    emit(GetAllNotificationsLoading());

    try {
      final data = apiClient.handleResponse<List<NotificationDto>>(
        await apiClient.api.apiNotificationsGetListGet(),
      );

      if (data.isEmpty) {
        emit(GetAllNotificationsEmpty());
      } else {
        emit(GetAllNotificationsSuccess(data));
      }
    } catch (error) {
      emit(GetAllNotificationsError(error));
    }
  }
}
