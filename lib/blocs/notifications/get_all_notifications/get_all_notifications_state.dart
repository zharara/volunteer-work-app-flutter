part of 'get_all_notifications_cubit.dart';

@immutable
abstract class GetAllNotificationsState {}

class GetAllNotificationsInitial extends GetAllNotificationsState {}

class GetAllNotificationsLoading extends GetAllNotificationsState {}

class GetAllNotificationsEmpty extends GetAllNotificationsState {}

class GetAllNotificationsError extends GetAllNotificationsState {
  final dynamic error;

  GetAllNotificationsError(this.error);
}

class GetAllNotificationsSuccess extends GetAllNotificationsState {
  final List<NotificationDto> data;

  GetAllNotificationsSuccess(this.data);
}
