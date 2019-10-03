import 'user_model.dart';

class LoginPOSTModel {
  String email;
  String password;

  LoginPOSTModel(this.email, this.password);

  LoginPOSTModel.fromJson(Map<String, dynamic> parsedJson) {
    email = parsedJson['email'];
    password = parsedJson['password'];
  }

  Map<String, String> toJson() {
    Map<String, String> json = Map();
    json['email'] = email;
    json['password'] = password;
    return json;
  }
}

class LoginRESPModel {
  String _userAccessToken;
  User _user;

  LoginRESPModel.fromJson(Map<String, dynamic> parsedJson) {
    _userAccessToken = parsedJson['userAccessToken'];
    _user = User.fromJson(parsedJson['user']);
  }

  String get userAccessToken => _userAccessToken;

  User get user => _user;
}
