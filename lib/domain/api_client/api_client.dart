import '../../constants/api_constants.dart';
import '../api_generated_code/api.models.swagger.dart';
import '../api_generated_code/client_index.dart';
import 'package:chopper/chopper.dart' as chopper;

import 'api_request_interceptor.dart';
import 'error_converter.dart';
import 'response_converter.dart';

class ApiClient {
  final Api _api;

  ApiClient._internal()
      : _api = Api.create(
          client: chopper.ChopperClient(
            baseUrl: Uri.parse(kApiBaseURL),
            converter: ResponseConverter(),
            errorConverter: ErrorConverter(),
            interceptors: [
              ApiRequestInterceptor(),
            ]
          ),
        );

  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  Api get api => _api;
}

extension $ApiClientExtensions on ApiClient {
  T handleResponse<T>(chopper.Response<T> response) {
    if (response.isSuccessful) {
      if (response.body != null) {
        return response.body!;
      }
    }

    if (response.error is ApiError) {
      throw response.error as ApiError;
    }

    throw ApiError(
      errorTitle: 'خطأ في الخادم',
      errorMessage: 'حدث خطأ داخلي في خادم الإنترنت',
    );
  }
}
