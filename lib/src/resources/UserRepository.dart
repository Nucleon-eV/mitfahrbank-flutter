import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mitfahrbank/src/models/login_model.dart';

import './login_api_provider.dart';

class UserRepository {
  final loginApiProvider = LoginProvider();

  Future<LoginRESPModel> login({
    @required String email,
    @required String password,
  }) =>
      loginApiProvider.doLogin(email, password);

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    debugPrint("logout");
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    debugPrint("loggedIn");
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    debugPrint("checkLogin");
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
