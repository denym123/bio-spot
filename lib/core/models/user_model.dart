class UserModel {
  final String token;
  final String? username;
  final List<String>? permissions;

  UserModel({
    required this.token,
    required this.permissions,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      permissions:
          json['permissions'] != null ? List.from(json['permissions']) : null,
      token: json['access_token'],
    );
  }
}
