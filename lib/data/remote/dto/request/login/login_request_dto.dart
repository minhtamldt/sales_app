import 'dart:convert';
import 'package:equatable/equatable.dart';

import '../base_request_dto.dart';

class LoginRequestDto extends BaseRequestDto {
	final String? email;
	final String? password;

	LoginRequestDto({this.email, this.password});

  @override
	List<Object?> get props => [email, password];

	factory LoginRequestDto.fromMap(Map<String, dynamic> data) {
		return LoginRequestDto(
			email: data['email'] as String?,
			password: data['password'] as String?,
		);
	}

  @override
	Map<String, dynamic> toJson() => {
				'email': email,
				'password': password,
			};
}
