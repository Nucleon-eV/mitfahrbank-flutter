import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mitfahrbank/src/models/mitfahrbank_model.dart';
import 'package:mitfahrbank/src/models/user_model.dart';

/// Journeys Response
/// This is what we get from GET /api/journeys
/*
{
  "data": [
    {
      "id": 46,
      "comment": "Dies ist ein test!",
      "matched_at": null,
      "confirmed": 0,
      "ended_at": null,
      "initiator_id": 53,
      "destination_id": 9,
      "start_id": 28,
      "driver_id": null,
      "created_at": 1570110263,
      "updated_at": 1570110263,
      "driver_message": null,
      "destination": {
        "id": 9,
        "name": "Flensburg ",
        "created_at": "2019-02-12 16:20:22",
        "updated_at": "2019-02-12 16:20:22"
      },
      "initiator": {
        "id": 53,
        "first_name": "Marcel",
        "last_name": "Radzio",
        "email": "mtrnord1@gmail.com",
        "first_install": 0,
        "uses_push_notifications": null,
        "uses_email_notifications": null,
        "created_at": 1570110223,
        "updated_at": 1570110246,
        "admin": 0,
        "verified": 0,
        "avatar": "avatars\/avatar_default.svg",
        "distance_to_start_in_meters": 0,
        "car_photo": null
      },
      "start": {
        "id": 28,
        "name": "Tarp",
        "latitude": "54.66786600",
        "longitude": "9.39289800",
        "created_at": "2019-02-12 16:20:22",
        "updated_at": "2019-02-12 16:20:22"
      },
      "passengers": [
        {
          "id": 53,
          "first_name": "Marcel",
          "last_name": "Radzio",
          "email": "mtrnord1@gmail.com",
          "first_install": 0,
          "uses_push_notifications": null,
          "uses_email_notifications": null,
          "created_at": 1570110223,
          "updated_at": 1570110246,
          "admin": 0,
          "verified": 0,
          "avatar": "avatars\/avatar_default.svg",
          "distance_to_start_in_meters": 0,
          "car_photo": null,
          "pivot": {
            "journey_id": 46,
            "user_id": 53
          }
        }
      ]
    }
  ]
}
* */
class JourneysResp {
  List<Journey> _data;

  JourneysResp.fromJson(Map<String, dynamic> parsedJson) {
    List<Journey> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      Journey journey = Journey.fromJson(parsedJson['data'][i]);
      temp.add(journey);
    }
    _data = temp;
  }

  List<Journey> get data => _data;
}

/*
* {
  "data": {
    "id": 45,
    "comment": "Dies ist ein test!",
    "matched_at": null,
    "confirmed": 0,
    "ended_at": null,
    "initiator_id": 49,
    "destination_id": 9,
    "start_id": 28,
    "driver_id": null,
    "created_at": 1570110080,
    "updated_at": 1570110080,
    "driver_message": null,
    "start": {
      "id": 28,
      "name": "Tarp",
      "latitude": "54.66786600",
      "longitude": "9.39289800",
      "created_at": "2019-02-12 16:20:22",
      "updated_at": "2019-02-12 16:20:22"
    },
    "destination": {
      "id": 9,
      "name": "Flensburg ",
      "created_at": "2019-02-12 16:20:22",
      "updated_at": "2019-02-12 16:20:22"
    },
    "driver": null
  }
}
* */

/// This is one single Journey
@immutable
class Journey extends Equatable {
  final int id;
  final String comment;
  final int matchedAt;
  final bool confirmed;
  final String endedAt;
  final int initiatorID;
  final int destinationID;
  final int startID;
  final int driverID;
  final String createdAt;
  final String updatedAt;
  final String driverMessage;
  final User initiator;
  final List<User> passengers;
  final Mitfahrbank destination;
  final Mitfahrbank start;
  final User driver;

  Journey(this.id,
      this.comment,
      this.matchedAt,
      this.confirmed,
      this.endedAt,
      this.initiatorID,
      this.destinationID,
      this.startID,
      this.driverID,
      this.createdAt,
      this.updatedAt,
      this.driverMessage,
      this.initiator,
      this.passengers,
      this.destination,
      this.start, this.driver,);

  static Journey fromJson(Map<String, dynamic> parsedJson) {
    List<User> passengersTemp = [];
    for (int i = 0; i < parsedJson['passengers'].length; i++) {
      User user = User.fromJson(parsedJson['passengers'][i]);
      passengersTemp.add(user);
    }
    return Journey(
      parsedJson["id"],
      parsedJson["comment"],
      parsedJson["matched_at"],
      parsedJson["confirmed"] == 1 ? true : false,
      parsedJson["ended_at"],
      parsedJson["initiator_id"],
      parsedJson["destination_id"],
      parsedJson["start_id"],
      parsedJson["driver_id"],
      parsedJson["created_at"],
      parsedJson["updated_at"],
      parsedJson["driver_message"],
      User.fromJson(parsedJson["initiator"]),
      passengersTemp,
      Mitfahrbank.fromJson(parsedJson["destination"]),
      Mitfahrbank.fromJson(parsedJson["start"]),
      User.fromJson(parsedJson["driver"]),
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'Journey { id: $id, comment: $comment, ended_at: $endedAt }';
  }
}
