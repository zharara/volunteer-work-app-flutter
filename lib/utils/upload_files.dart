import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';
import 'package:volunteer_work_app/main.dart';

import '../constants/api_constants.dart';

Stream<int> uploadOneFile({
  required File file,
  required void Function(TempFileDto uploadedTempFile) onResult,
  required void Function(ApiError apiError) onError,
  required CancelToken cancelToken,
}) {
  final dio = Dio(BaseOptions(
    contentType: "multipart/form-data",
    headers: {'Authorization': 'Bearer ${globalAppStorage.getAccessToken()}'},
  ));

  StreamController<int> streamController = StreamController<int>();

  final formData = FormData();

  final fileName = file.path.split('/').last;
  formData.files.add(MapEntry(fileName,
      MultipartFile.fromBytes(file.readAsBytesSync(), filename: fileName)));

  dio.post<dynamic>(
    kUploadOneFileURL,
    data: formData,
    cancelToken: cancelToken,
    onSendProgress: (int sent, int total) {
      streamController.add(((sent / total) * 100).toInt());
    },
  ).then((response) {
    onResult(TempFileDto.fromJson(response.data));

    dio.close(force: true);
  }).catchError((error) {
    _handleError(error: error, onError: onError);

    dio.close(force: true);
  });

  return streamController.stream;
}

Stream<int> uploadFiles({
  required List<File> files,
  required void Function(List<TempFileDto> uploadedTempFiles) onResult,
  required void Function(ApiError apiError) onError,
  required CancelToken cancelToken,
}) {
  final dio = Dio(BaseOptions(
    contentType: "multipart/form-data",
    headers: {'Authorization': 'Bearer ${globalAppStorage.getAccessToken()}'},
  ));

  StreamController<int> streamController = StreamController<int>();

  final formData = FormData();

  for (final file in files) {
    final fileName = file.path.split('/').last;
    formData.files.add(MapEntry(fileName,
        MultipartFile.fromBytes(file.readAsBytesSync(), filename: fileName)));
  }

  dio.post<List<dynamic>>(
    kUploadFilesURL,
    data: formData,
    cancelToken: cancelToken,
    onSendProgress: (int sent, int total) {
      streamController.add(((sent / total) * 100).toInt());
    },
  ).then((response) {
    onResult(response.data?.map((e) => TempFileDto.fromJson(e)).toList() ?? []);

    dio.close(force: true);
  }).catchError((error) {
    _handleError(error: error, onError: onError);

    dio.close(force: true);
  });

  return streamController.stream;
}

void _handleError(
    {required dynamic error,
    required void Function(ApiError apiError) onError}) {
  if (error is DioError) {
    debugPrint(error.message);
    debugPrintStack(stackTrace: error.stackTrace);

    if (error.response?.data?['errorTitle'] != null) {
      onError(ApiError.fromJson(error.response?.data));
    } else if (error.response?.data?['title'] != null) {
      onError(ApiError(
        errorTitle: 'خطأ في الطلب',
        errorMessage: error.response?.data['title'],
        errorDetails: error.response?.data['errors'].toString(),
      ));
    } else {
      onError(ApiError(
        errorTitle: 'خطأ أثناء الرفع',
        errorMessage: 'حدث خطأ ما أثناء محاولة رفع ملفات',
      ));
    }
  } else {
    onError(ApiError(
      errorTitle: 'خطأ أثناء الرفع',
      errorMessage: 'حدث خطأ ما أثناء محاولة رفع ملفات',
    ));
  }
}
