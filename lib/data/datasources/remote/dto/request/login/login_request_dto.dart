import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LoginRequestDto extends Equatable {
	late String email;
	final String password;

	LoginRequestDto({required this.email, required this.password});

	Map<String, dynamic> toJson() => {
				'email': email,
				'password': password,
			};

	LoginRequestDto copyWith({
		String? email,
		String? password,
	}) {
		return LoginRequestDto(
			email: email ?? this.email,
			password: password ?? this.password,
		);
	}

	@override
	List<Object?> get props => [email, password];
}
