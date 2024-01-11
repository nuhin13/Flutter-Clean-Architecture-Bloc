import 'dart:convert';

class UserInfo {
  final String userName;
  final String fullName;
  final String? ogrName;
  final String? role;
  final String accessToken;
  final String? refreshToken;
  final String? phone;
  final String? email;

  UserInfo({
    required this.userName,
    required this.fullName,
    this.ogrName,
    required this.role,
    required this.accessToken,
    required this.refreshToken,
    this.phone,
    this.email,
  });

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'fullName': fullName,
        'ogrName': ogrName,
        'role': role,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'phone': phone,
        'email': email,
      };

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userName: json['userName'],
        fullName: json['fullName'],
        ogrName: json['ogrName'],
        role: json['role'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        phone: json['phone'],
        email: json['email'],
      );

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory UserInfo.fromJsonString(String json) {
    return UserInfo.fromJson(jsonDecode(json));
  }
}
