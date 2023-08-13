import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:volunteer_work_app/main.dart';

class ApiRequestInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    String? accessToken = globalAppStorage.getAccessToken();

    request = applyHeaders(
        request,
        {
          'content-type': 'application/json; charset=UTF-8',
          'accept': '*/*',
          'connection': 'keep-alive',
          'authorization': 'Bearer $accessToken',
          'accept-language': 'ar'
        },
        override: true);

    /// as console log
    debugPrint('Request method > ${request.method}');
    debugPrint('Request URL > ${request.url}');
    debugPrint('Request parameters > ${request.parameters}');
    debugPrint('Request headers > ${request.headers}');
    debugPrint('Request body > ${request.body}');
    debugPrint('Request baseURL > ${request.baseUri.path}');
    debugPrint('Request is multipart > ${request.multipart}');
    debugPrint('Request parts > ${request.parts}');

    return request;
  }
}
