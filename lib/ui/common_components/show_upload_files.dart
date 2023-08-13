import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:volunteer_work_app/domain/api_generated_code/api.models.swagger.dart';

import '../../utils/upload_files.dart';
import 'add_size.dart';
import 'snack_bars.dart';

Future<TempFileDto?> showUploadFile(BuildContext context, File file) async {
  return showDialog<TempFileDto>(
    context: context,
    builder: (ctx) {
      final cancelToken = CancelToken();

      final uploadStream = uploadOneFile(
          file: file,
          onError: (e) {
            Navigator.pop(context);
            showErrorSnackBar(
                context: context,
                message: e.errorMessage ?? 'حدث خطأ أثناء الرفع');
          },
          onResult: (uploadedFile) {
            Navigator.pop(context, uploadedFile);
            showSuccessSnackBar(
                context: context, message: 'تم رفع الملف بنجاح');
          },
          cancelToken: cancelToken);
      return _uploadDialog(
          context: context,
          uploadStream: uploadStream,
          cancelToken: cancelToken);
    },
  );
}

Future<List<TempFileDto>?> showUploadFiles(
    BuildContext context, List<File> files) async {
  return showDialog<List<TempFileDto>>(
    context: context,
    builder: (ctx) {
      final cancelToken = CancelToken();

      final uploadStream = uploadFiles(
          files: files,
          onError: (e) {
            Navigator.pop(context);
            showErrorSnackBar(
                context: context,
                message: e.errorMessage ?? 'حدث خطأ أثناء الرفع');
          },
          onResult: (uploadedFiles) {
            Navigator.pop(context, uploadedFiles);
            showSuccessSnackBar(
                context: context, message: 'تم رفع الملفات بنجاح');
          },
          cancelToken: cancelToken);
      return _uploadDialog(
          context: context,
          uploadStream: uploadStream,
          cancelToken: cancelToken,
          isMany: true);
    },
  );
}

Widget _uploadDialog({
  required BuildContext context,
  required Stream<int> uploadStream,
  required CancelToken cancelToken,
  bool isMany = false,
}) {
  return AlertDialog(
    title: Text(isMany ? 'جار رفع الملفات...' : 'جار رفع الملف...'),
    content: StreamBuilder<int>(
      stream: uploadStream,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          final ratio = (snapshot.data ?? 0) / 100;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${snapshot.data ?? 0}%'),
              addHorizontalSize(20),
              CircularProgressIndicator(
                value: ratio == 1 ? null : (snapshot.data ?? 0) / 100,
              ),
            ],
          );
        }

        return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()]);
      },
    ),
    actions: [
      TextButton(
        onPressed: () async {
          cancelToken.cancel();
          cancelToken.whenCancel.then(
            (value) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إلغاء الرفع')),
              );
            },
          );
        },
        child: const Text('إلغاء الرفع'),
      ),
    ],
  );
}
