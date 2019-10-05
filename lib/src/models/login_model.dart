import 'package:flutter/material.dart';

import 'user_model.dart';

@immutable
class LoginPOSTModel {
  final String email;
  final String password;

  LoginPOSTModel(this.email, this.password);

  static LoginPOSTModel fromJson(Map<String, dynamic> parsedJson) {
    return LoginPOSTModel(
      parsedJson['email'],
      parsedJson['password'],
    );
  }

  Map<String, String> toJson() {
    Map<String, String> json = Map();
    json['email'] = email;
    json['password'] = password;
    return json;
  }
}

@immutable
class LoginRESPModel {
  final String userAccessToken;
  final User user;

  LoginRESPModel(this.userAccessToken, this.user);

  static LoginRESPModel fromJson(Map<String, dynamic> parsedJson) {
    return LoginRESPModel(
      parsedJson['userAccessToken'],
      User.fromJson(parsedJson['user']),
    );
  }
}
