import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:mitfahrbank/src/models/login_model.dart';
import 'package:mitfahrbank/src/resources/db/DatabaseProvider.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'http/login/login_api_provider.dart';

class UserRepository {
  final loginApiProvider = LoginProvider();
  final databaseProvider = DatabaseProvider();

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

  Future<void> persistUser(LoginRESPModel resp) async {
    await databaseProvider.addUser(UsersCompanion(
      id: Value(resp.user.id),
      own: Value(true),
      token: Value(resp.userAccessToken),
      email: Value(resp.user.email),
      firstName: Value(resp.user.firstName),
      lastName: Value(resp.user.lastName),
      firstInstall: Value(resp.user.firstInstall),
      usesPushNotifications: Value(resp.user.usesPushNotifications),
      usesEmailNotifications: Value(resp.user.usesEmailNotifications),
      createdAt: Value(resp.user.createdAt),
      updatedAt: Value(resp.user.updatedAt),
      admin: Value(resp.user.admin),
      verified: Value(resp.user.verified),
      avatar: Value(resp.user.avatar),
      distanceToStartInMeters: Value(resp.user.distanceToStartInMeters),
      carPhoto: Value(resp.user.carPhoto),
    ));
    return;
  }

  Future<bool> hasToken() async {
    User ownUserDB = await databaseProvider.ownUser;
    if (ownUserDB != null) {
      if (ownUserDB.token != null && ownUserDB.token != "") {
        return true;
      }
    }
    return false;
  }

  Future<String> getToken() async {
    User ownUserDB = await databaseProvider.ownUser;
    if (ownUserDB != null) {
      if (ownUserDB.token != null && ownUserDB.token != "") {
        return ownUserDB.token;
      }
    }
    return null;
  }
}
