import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
	final String? email;
	final String? name;
	final String? phone;
	final int? userGroup;
	final DateTime? registerDate;
	final String? token;

	const UserDto({
		this.email, 
		this.name, 
		this.phone, 
		this.userGroup, 
		this.registerDate, 
		this.token, 
	});

	factory UserDto.fromMap(Map<String, dynamic> data) => UserDto(
				email: data['email'] as String?,
				name: data['name'] as String?,
				phone: data['phone'] as String?,
				userGroup: data['userGroup'] as int?,
				registerDate: data['registerDate'] == null
						? null
						: DateTime.parse(data['registerDate'] as String),
				token: data['token'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'email': email,
				'name': name,
				'phone': phone,
				'userGroup': userGroup,
				'registerDate': registerDate?.toIso8601String(),
				'token': token,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
	factory UserDto.fromJson(String data) {
		return UserDto.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				email,
				name,
				phone,
				userGroup,
				registerDate,
				token,
		];
	}
}
