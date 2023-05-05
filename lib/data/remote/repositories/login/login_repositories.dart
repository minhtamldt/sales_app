import 'package:sales_app/common/constants/api_constant.dart';
import 'package:sales_app/data/remote/dto/request/login/login_request_dto.dart';
import 'package:sales_app/data/remote/dto/response/base_response_dto.dart';

import '../../dto/response/login/login_response_dto/login_respone_dto/login_respone_dto.dart';
import '../../restapi/rest_api.dart';

class LoginRepository {
  late RestApi _restApi;

    void setApiRequest(RestApi apiRequest) {
    _restApi = apiRequest;
  }

  Future<ApiResponse<LoginResponeDto>> loginAsync(LoginRequestDto request) async{
    var sendRespone = await  _restApi.sendPostAsync(ApiConstant.LOGIN, request);
    var apiResponse = ApiResponse<LoginResponeDto>(
        statusCode: sendRespone.statusCode,
        statusMessage: sendRespone.statusMessage,
        data: LoginResponeDto.fromMap(sendRespone.data as Map<String, dynamic>));
    return apiResponse;
  }
}