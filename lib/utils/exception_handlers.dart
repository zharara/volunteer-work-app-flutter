import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import '../domain/api_generated_code/api.models.swagger.dart';
import '../ui/common_components/dialogs.dart';

showNetworkException({
  required BuildContext context,
  required dynamic error,
}) {
  if (error is ApiError) {
    showErrorDialog(
      context: context,
      title: error.errorTitle ?? 'خطأ',
      message: error.errorMessage ?? 'حدث خطأ ما',
      details: error.errorDetails,
    );
  } else if (error is TimeoutException) {
    showErrorDialog(
      context: context,
      title: 'خطأ في الطلب',
      message: 'استغرق الطلب وقتاً طويلاً',
      details: error.message,
    );
  } else if (error is SocketException) {
    showErrorDialog(
      context: context,
      title: 'خطأ في الاتصال',
      message: 'تأكد من توفر الاتصال بالإنترنت',
    );
  } else if (error is WebSocketException) {
    showErrorDialog(
      context: context,
      title: 'خطأ في الاتصال',
      message: 'تأكد من توفر الاتصال بالإنترنت',
    );
  } else if (error is IOException) {
    showErrorDialog(
      context: context,
      title: 'خطأ في العملية',
      message: 'تأكد من الاتصال أو صلاحيات التطبيق',
    );
  } else {
    showErrorDialog(
      context: context,
      title: 'حدث خطأ',
      message: 'حدث خطأ ما، يرجى التأكد من الاتصال أو صلاحيات التطبيق',
    );
  }
}
