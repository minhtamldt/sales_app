class LoginResponseDto {
  final String email;
  final String name;
  final String phone;
  final int userGroup;
  final DateTime registerDate;
  final String token;

  LoginResponseDto({
    required this.email,
    required this.name,
    required this.phone,
    required this.userGroup,
    required this.registerDate,
    required this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      userGroup: json['userGroup'],
      registerDate: DateTime.parse(json['registerDate']),
      token: json['token'],
    );
  }
}
