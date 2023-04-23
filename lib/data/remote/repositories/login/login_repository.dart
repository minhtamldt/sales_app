import 'dart:async';
import 'package:dio/dio.dart';
import 'package:sales_app/common/constants/api_constant.dart';
import 'package:sales_app/data/remote/dto/response/login/login_response_dto/login_response_dto.dart';
import '../../dto/request/login/login_request_dto.dart';
import '../../dto/response/base_response_dto.dart';
import '../../restapi/rest_api.dart';

abstract class ILoginRepository
{
   Future<BaseResponseDto<LoginResponseDto>> loginAsync(LoginRequestDto model);
}

class LoginRepository extends ILoginRepository  {

  late IRestApi _restApi;

  LoginRepository(IRestApi restApi) {
    _restApi = restApi;
  }

  @override
  Future<BaseResponseDto<LoginResponseDto>> loginAsync(LoginRequestDto model) async {

    var completer = Completer<BaseResponseDto<LoginResponseDto>>(); 
    try {
          Response response = await _restApi.sendGetRequestAsync(ApiConstant.LOGIN, model.toJson());
          BaseResponseDto<LoginResponseDto> rs = BaseResponseDto.fromJson(response.data, LoginResponseDto.fromJson);
          var completer = Completer<BaseResponseDto<LoginResponseDto>>();
          completer.complete(rs);
    }on DioError catch (e) {
      completer.completeError(e.response?.data["message"]);
    } catch(e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}