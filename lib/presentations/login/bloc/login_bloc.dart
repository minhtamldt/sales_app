import 'package:sales_app/common/bases/base_bloc.dart';
import 'package:sales_app/common/bases/base_event.dart';
import 'package:sales_app/common/constants/preference_key.dart';
import 'package:sales_app/data/remote/dto/request/login/login_request_dto.dart';
import 'package:sales_app/data/remote/repositories/login/login_repositories.dart';
import 'package:sales_app/presentations/login/bloc/login_event.dart';

import '../../../data/local/cache/app_sharepreference.dart';
import '../../../data/remote/dto/response/base_response_dto.dart';
import '../../../data/remote/dto/response/login/login_response_dto/login_respone_dto/login_respone_dto.dart';
import 'login_success_event.dart';

class LoginBloc extends BaseBloc {
  late LoginRepository _loginRepository;

    void setRepository(LoginRepository repository) {
    _loginRepository = repository;
  }

  @override void dispatch(BaseEvent event) {
    switch (event.runtimeType) {
      case LoginEvent:
        executeSignIn(event as LoginEvent);
        break;
    }
  }

  void executeSignIn(LoginEvent event) async {
    //show loading
    loadingSink.add(true);

    var request = LoginRequestDto(email: event.email, password: event.password);
    await _loginRepository.loginAsync(request)
    .then((response){

      if(response == null)
        return;

      if(response!.isSuccess()) {
        AppSharePreference.setString(key: PreferenceKey.TOKEN, value: response.data!.data!.token!.toString());
        messageSink.add("Login success");
        progressSink.add(LoginInSuccessEvent());
      }
    })
    .catchError((e) {
      messageSink.add(e.toString());
    })
    .whenComplete(() {
      loadingSink.add(false);
    });
  }
}