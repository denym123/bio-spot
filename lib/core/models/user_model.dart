class UserModel {
  final String token;
  final String? username;
  final List<String>? permissions;
  final String? role;

  UserModel({
    this.role,
    required this.token,
    required this.permissions,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      role: json['role_slug'],
      username: json['name'],
      permissions:
          json['permissions'] != null ? List.from(json['permissions']) : null,
      token: json['access_token'],
    );
  }
}
