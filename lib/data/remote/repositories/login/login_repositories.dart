import 'package:sales_app/common/constants/api_constant.dart';
import 'package:sales_app/data/remote/dto/request/login/login_request_dto.dart';

import '../../dto/response/login/login_response_dto/login_respone_dto/login_respone_dto.dart';
import '../../restapi/rest_api.dart';

class LoginRepository {
  late RestApi _restApi;

    void setApiRequest(RestApi apiRequest) {
    _restApi = apiRequest;
  }

  Future<LoginResponeDto> loginAsync(LoginRequestDto request) async{
    var rs = await  _restApi.sendPostAsync(ApiConstant.LOGIN, request);
    return rs as LoginResponeDto;
  }
}