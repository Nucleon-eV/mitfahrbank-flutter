import 'package:flutter/material.dart';

@immutable
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final bool firstInstall;
  final bool usesPushNotifications;
  final bool usesEmailNotifications;
  final int createdAt;
  final int updatedAt;
  final bool admin;
  final bool verified;
  final String avatar;
  final int distanceToStartInMeters;
  final String carPhoto;
  final Pivot pivot;

  User(this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.firstInstall,
      this.usesPushNotifications,
      this.usesEmailNotifications,
      this.createdAt,
      this.updatedAt,
      this.admin,
      this.verified,
      this.avatar,
      this.distanceToStartInMeters,
      this.carPhoto,
      this.pivot,);

  static User fromJson(Map<String, dynamic> parsedJson) {
    return User(
      parsedJson['id'],
      parsedJson['first_name'],
      parsedJson['last_name'],
      parsedJson['email'],
      parsedJson['first_install'] == 1 ? true : false,
      parsedJson['uses_push_notifications'] == 1 ? true : false,
      parsedJson['uses_email_notifications'] == 1 ? true : false,
      parsedJson['created_at'],
      parsedJson['updated_at'],
      parsedJson['admin'] == 1 ? true : false,
      parsedJson['verified'] == 1 ? true : false,
      parsedJson['avatar'],
      parsedJson['distance_to_start_in_meters'],
      parsedJson['car_photo'],
      parsedJson["links"] != null ? Pivot.fromJson(parsedJson["pivot"]) : null,
    );
  }
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
