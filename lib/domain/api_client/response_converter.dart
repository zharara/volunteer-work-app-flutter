import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;
import 'package:flutter/foundation.dart';

import '../api_generated_code/api.swagger.dart';

class ResponseConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);

    debugPrint('Response body > ${response.body}');

    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}
