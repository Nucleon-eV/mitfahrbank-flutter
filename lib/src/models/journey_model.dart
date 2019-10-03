import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'general_model.dart';
import 'mitfahrbank_model.dart';
import 'user_model.dart';

/// Journeys Response
/// This is what we get from GET /api/journeys
class JourneysResp {
  List<Journey> _data;

  JourneysResp.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson["data"] != null) {
      List<Journey> temp = [];
      for (int i = 0; i < parsedJson['data'].length; i++) {
        Journey journey = Journey.fromJson(parsedJson['data'][i]);
        temp.add(journey);
      }
      _data = temp;
    }
  }

  List<Journey> get data => _data;
}

/// Journey (Detail) Response
/// This is what we get from GET /api/journeys
class JourneyResp {
  Journey _data;

  JourneyResp.fromJson(Map<String, dynamic> parsedJson) {
    _data = Journey.fromJson(parsedJson["data"]);
  }

  Journey get data => _data;
}

/// Journeys as a Driver Response
/// This is what we get from GET /api/user/journeys/driver
class JourneysDriverResp {
  List<Journey> _data;
  Links _links;
  Meta _meta;

  JourneysDriverResp.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson["data"] != null) {
      List<Journey> temp = [];
      for (int i = 0; i < parsedJson['data'].length; i++) {
        Journey journey = Journey.fromJson(parsedJson['data'][i]);
        temp.add(journey);
      }
      _data = temp;
    }

    _links = parsedJson["links"] != null
        ? Links.fromJson(parsedJson["links"])
        : null;
    _meta =
    parsedJson["meta"] != null ? Meta.fromJson(parsedJson["meta"]) : null;
  }

  List<Journey> get data => _data;

  Links get links => _links;

  Meta get meta => _meta;
}

/// This is one single Journey
@immutable
class Journey extends Equatable {
  final int id;
  final String comment;
  final int matchedAt;
  final bool confirmed;
  final int endedAt;
  final int initiatorID;
  final int destinationID;
  final int startID;
  final int driverID;
  final int createdAt;
  final int updatedAt;
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
      this.start,
      this.driver,);

  static Journey fromJson(Map<String, dynamic> parsedJson) {
    List<User> passengersTemp;
    if (parsedJson["passengers"] != null) {
      passengersTemp = [];
      for (int i = 0; i < parsedJson['passengers'].length; i++) {
        User user = User.fromJson(parsedJson['passengers'][i]);
        passengersTemp.add(user);
      }
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
      parsedJson["initiator"] != null
          ? User.fromJson(parsedJson["initiator"])
          : null,
      passengersTemp,
      parsedJson["destination"] != null
          ? Mitfahrbank.fromJson(parsedJson["destination"])
          : null,
      parsedJson["start"] != null
          ? Mitfahrbank.fromJson(parsedJson["start"])
          : null,
      parsedJson["driver"] != null ? User.fromJson(parsedJson["driver"]) : null,
    );
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'Journey { id: $id, comment: $comment, matched_at: $matchedAt, confirmed: $confirmed, ended_at: $endedAt, initiator_id: $initiatorID, destination_id: $destinationID, start_id: $startID, driver_id: $driverID, created_at: $createdAt, updated_at: $updatedAt, driver_message: $driverMessage, initiator: $initiator, passengers: ${passengers
        .toString()}, destination: $destination, start: $start, driver: $driver }';
  }
}
