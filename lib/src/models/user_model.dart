import 'package:flutter/material.dart';

class User {
  int _id;
  String _firstName;
  String _lastName;
  String _email;
  bool _firstInstall;
  bool _usesPushNotifications;
  bool _usesEmailNotifications;
  String _createdAt;
  String _updatedAt;
  bool _admin;
  bool _verified;
  String _avatar;
  int _distanceToStartInMeters;
  String _carPhoto;
  Pivot _pivot;

  User.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _firstName = parsedJson['first_name'];
    _lastName = parsedJson['last_name'];
    _email = parsedJson['email'];
    _firstInstall = parsedJson['first_install'] == 1 ? true : false;
    _usesPushNotifications =
    parsedJson['uses_push_notifications'] == 1 ? true : false;
    _usesEmailNotifications =
    parsedJson['uses_email_notifications'] == 1 ? true : false;
    _createdAt = parsedJson['created_at'];
    _updatedAt = parsedJson['updated_at'];
    _admin = parsedJson['admin'] == 1 ? true : false;
    _verified = parsedJson['verified'] == 1 ? true : false;
    _avatar = parsedJson['avatar'];
    _distanceToStartInMeters = parsedJson['distance_to_start_in_meters'];
    _distanceToStartInMeters = parsedJson['car_photo'];
    _pivot = Pivot.fromJson(parsedJson["pivot"]);
  }

  int get id => _id;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  bool get firstInstall => _firstInstall;

  bool get usesPushNotifications => _usesPushNotifications;

  bool get usesEmailNotifications => _usesEmailNotifications;

  String get createdAt => _createdAt;

  String get updatedAt => _updatedAt;

  bool get admin => _admin;

  bool get verified => _verified;

  String get avatar => _avatar;

  int get distanceToStartInMeters => _distanceToStartInMeters;

  String get carPhoto => _carPhoto;

  Pivot get pivot => _pivot;
}

@immutable
class Pivot {
  final int journeyID;
  final int userID;

  Pivot(this.journeyID, this.userID);

  static Pivot fromJson(Map<String, dynamic> parsedJson) {
    return Pivot(
      parsedJson["journey_id"],
      parsedJson["user_id"],
    );
  }
}
