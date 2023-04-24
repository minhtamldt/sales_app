import 'package:dio/dio.dart';
import 'package:sales_app/common/constants/api_constant.dart';
import 'package:sales_app/common/constants/preference_key.dart';
import '../../local/cache/app_sharepreference.dart';

class DioClient {
  Dio? _dio;
  static final BaseOptions _options = BaseOptions(
    baseUrl: ApiConstant.HOST,
    connectTimeout: const Duration(seconds: 3),
    receiveTimeout: const Duration(seconds: 3),
  );

  static final DioClient instance = DioClient._internal();

  DioClient._internal() {
    if (_dio == null){
      _dio = Dio(_options);
      _dio!.interceptors.add(LogInterceptor(requestBody: true));
      _dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        String token = AppSharePreference.getString(PreferenceKey.TOKEN);
        options.headers["Authorization"] = "Bearer " + token;
        return handler.next(options);
      }));
    }
  }

  Dio get dio => _dio!;
}