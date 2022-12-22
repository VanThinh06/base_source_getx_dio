// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    this.timezone,
    this.password,
    this.username,
    this.clientId,
  });

  int? timezone;
  String? password;
  String? username;
  String? clientId;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        timezone: json["timezone"] == null ? null : json["timezone"],
        password: json["password"] == null ? null : json["password"],
        username: json["username"] == null ? null : json["username"],
        clientId: json["clientId"] == null ? null : json["clientId"],
      );

  Map<String, dynamic> toJson() => {
        "timezone": timezone == null ? null : timezone,
        "password": password == null ? null : password,
        "username": username == null ? null : username,
        "clientId": clientId == null ? null : clientId,
      };
}
