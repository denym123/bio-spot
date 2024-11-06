class LoginRequestDto {
  final String username;
  final String password;

  LoginRequestDto({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': username,
      'password': password,
    };
  }
}
