import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sales_app/common/constants/api_constant.dart';
import '../dto/response/base_response_dto.dart';

abstract class IRestApi {
  Future<Response<BaseResponseDto>> sendPostRequestAsync(String method, Map<String, dynamic>? queryParamters);
  Future<Response<BaseResponseDto>> sendGetRequestAsync(String method, Map<String, dynamic>? queryParamters);
}

class RestApi extends IRestApi {

  late Dio _dio;

  RestApi() {

    var options = BaseOptions(
      baseUrl: ApiConstant.HOST,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10)
    );
    _dio = Dio(options);
  }

  @override
  Future<Response<BaseResponseDto>> sendPostRequestAsync (String method, Map<String, dynamic>? queryParamters) {
    return _dio.post(method, data: null, queryParameters: queryParamters);
  }

   @override
  Future<Response<BaseResponseDto>> sendGetRequestAsync (String method, Map<String, dynamic>? queryParamters) {
    return _dio.get(method, data: null, queryParameters: queryParamters);
  }
}