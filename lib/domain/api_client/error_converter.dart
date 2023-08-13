import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;

import '../api_generated_code/api.swagger.dart';
import '../api_generated_code/client_mapping.dart';

class ErrorConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response> convertError<BodyType, Item>(
      chopper.Response response) async {

    if (response.bodyString.isEmpty) {
      return chopper.Response(response.base, null, error: response.error);
    }

    var jsonRes = await super.convertResponse(response);

    if (jsonRes.body['errorTitle'] != null) {
      generatedMapping.putIfAbsent(ApiError, () => ApiError.fromJsonFactory);
      jsonRes = jsonRes.copyWith(
          bodyError: $jsonDecoder.decode<ApiError>(jsonRes.body));
    } else if (jsonRes.body['title'] != null) {
      jsonRes = jsonRes.copyWith(
        bodyError: ApiError(
          errorTitle: 'خطأ في الطلب',
          errorMessage: jsonRes.body['title'],
          errorDetails: jsonRes.body['errors'].toString(),
        ),
      );
    } else {
      jsonRes = jsonRes.copyWith(
        bodyError: ApiError(
          errorTitle: 'خطأ في الخادم',
          errorMessage: 'حدث خطأ داخلي في خادم الإنترنت',
        ),
      );
    }

    return jsonRes;
  }
}
