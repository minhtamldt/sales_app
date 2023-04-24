import 'package:sales_app/common/bases/base_bloc.dart';
import 'package:sales_app/common/bases/base_event.dart';
import 'package:sales_app/data/remote/repositories/login/login_repositories.dart';
import 'package:sales_app/presentations/login/bloc/login_event.dart';

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

  void executeSignIn(LoginEvent event) {
      
  }
}