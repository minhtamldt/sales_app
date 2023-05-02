import 'package:dio/dio.dart';
import 'package:sales_app/common/constants/api_constant.dart';
import 'package:sales_app/common/constants/preference_key.dart';
import '../../local/cache/app_sharepreference.dart';

class DioClient {
  static const Duration TIME_OUT = Duration(seconds: 10);
  static final DioClient instance = DioClient._internal();

  Dio? _dio;
  Dio get dio => _dio!;

  DioClient._internal() {

    if (_dio == null){
      var baseOption = BaseOptions(
        baseUrl: ApiConstant.HOST,
        connectTimeout: TIME_OUT,
        receiveTimeout: TIME_OUT,
      );

      _dio = Dio(baseOption);
      _dio!.interceptors.add(LogInterceptor(requestBody: true));
      _dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        String token = AppSharePreference.getString(PreferenceKey.TOKEN);
        options.headers["Authorization"] = "Bearer " + token;
        return handler.next(options);
      }));
    }
  }
}