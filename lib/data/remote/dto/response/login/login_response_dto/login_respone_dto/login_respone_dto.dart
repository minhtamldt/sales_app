import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sales_app/data/remote/dto/request/base_request_dto.dart';
import 'package:sales_app/data/remote/dto/response/base_response_dto.dart';

import 'data.dart';

class LoginResponeDto {
	final int? result;
	final UserDto? data;
	final String? message;

	LoginResponeDto({this.result, this.data, this.message});

	factory LoginResponeDto.fromMap(Map<String, dynamic> data) {
		return LoginResponeDto(
			result: data['result'] as int?,
			data: data['data'] == null
						? null
						: UserDto.fromMap(data['data'] as Map<String, dynamic>),
			message: data['message'] as String?,
		);
	}

	@override
	List<Object?> get props => [result, data, message];
}
