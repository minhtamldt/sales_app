import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sales_app/data/remote/dto/request/base_request_dto.dart';
import 'package:sales_app/data/remote/dto/response/base_response_dto.dart';

import 'data.dart';

class LoginResponeDto extends BaseResponeDto {
	final int? result;
	final Data? data;
	final String? message;

	LoginResponeDto({this.result, this.data, this.message});

	factory LoginResponeDto.fromMap(Map<String, dynamic> data) {
		return LoginResponeDto(
			result: data['result'] as int?,
			data: data['data'] == null
						? null
						: Data.fromMap(data['data'] as Map<String, dynamic>),
			message: data['message'] as String?,
		);
	}

  /// Parses the string and returns the resulting Json object as [LoginResponeDto].
	factory LoginResponeDto.fromJson(String data) {
		return LoginResponeDto.fromMap(json.decode(data) as Map<String, dynamic>);
	}

	@override
	List<Object?> get props => [result, data, message];
}
