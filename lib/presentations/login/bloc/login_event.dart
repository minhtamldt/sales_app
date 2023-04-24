import 'package:sales_app/common/bases/base_event.dart';

class LoginEvent extends BaseEvent {

  String email;
  String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}