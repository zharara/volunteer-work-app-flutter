import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:open_file/open_file.dart';

import '../../constants/api_constants.dart';
import '../../main.dart';
import 'snack_bars.dart';

Future<void> downloadAndOpenFileDialog(
    {required BuildContext context, required String fileKey}) async {
  String? accessToken = globalAppStorage.getAccessToken();

  Stream<FileResponse?> fileStream = DefaultCacheManager().getFileStream(
      '$kApiBaseURL/$kDownloadFilesURL?id=$fileKey',
      withProgress: true,
      key: fileKey,
      headers: {'Authorization': 'Bearer $accessToken'});

  showDialog(
    context: context,
    builder: (dContext) {
      return StreamBuilder<FileResponse?>(
          stream: fileStream,
          builder: (ctx, snapshot) {
            if (snapshot.data is DownloadProgress) {
              return WillPopScope(
                onWillPop: () async {
                  return await showDialog<bool>(
                        context: context,
                        builder: (dContext) => AlertDialog(
                          title: Text(
                            'إيقاف التنزيل',
                          ),
                          content: Text(
                            'متأكد من إيقاف تنزيل الملف؟',
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(dContext, false);
                                },
                                child: Text('متابعة')),
                            TextButton(
                              onPressed: () async {
                                DefaultCacheManager()
                                    .removeFile(fileKey);

                                Navigator.pop(dContext, true);
                              },
                              child: Text(
                                'إيقاف',
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ),
                            ),
                          ],
                        ),
                      ) ??
                      true;
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10)),
                    child: CircularProgressIndicator(
                      value: (snapshot.data as DownloadProgress).progress,
                    ),
                  ),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data is FileInfo) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(dContext);

                  OpenFile.open((snapshot.data as FileInfo).file.path);
                });
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(dContext);

                  showErrorSnackBar(
                      message: 'حدث خطأ ما أثناء التنزيل', context: context);
                });
              }
            }

            return Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius:
                        BorderRadius.circular(10)),
                child: const CircularProgressIndicator(),
              ),
            );
          });
    },
    barrierDismissible: false,
  );
}
