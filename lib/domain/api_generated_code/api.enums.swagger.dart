import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum ApplicationStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Pending')
  pending('Pending'),
  @JsonValue('Approved')
  approved('Approved'),
  @JsonValue('Rejected')
  rejected('Rejected');

  final String? value;

  const ApplicationStatus(this.value);
}

enum NotificationPage {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Home')
  home('Home'),
  @JsonValue('Notifications')
  notifications('Notifications'),
  @JsonValue('Chats')
  chats('Chats');

  final String? value;

  const NotificationPage(this.value);
}
