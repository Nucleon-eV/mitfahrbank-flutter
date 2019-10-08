import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'general_model.dart';
import 'mitfahrbank_model.dart';
import 'user_model.dart';

/// Journeys Response
/// This is what we get from GET /api/journeys
@immutable
class JourneysResp {
  final List<Journey> data;

  JourneysResp(this.data);

  static JourneysResp fromJson(Map<String, dynamic> parsedJson) {
    List<Journey> temp = [];
    if (parsedJson["data"] != null) {
      for (int i = 0; i < parsedJson['data'].length; i++) {
        Journey journey = Journey.fromJson(parsedJson['data'][i]);
        temp.add(journey);
      }
    }
    return JourneysResp(temp);
  }
}

/// Journey (Detail) Response
/// This is what we get from GET /api/journeys
@immutable
class JourneyResp {
  final Journey data;

  JourneyResp(this.data);

  static JourneyResp fromJson(Map<String, dynamic> parsedJson) {
    return JourneyResp(Journey.fromJson(parsedJson["data"]));
  }
}

/// Journeys as a Driver Response
/// This is what we get from GET /api/user/journeys/driver
@immutable
class JourneysDriverResp {
  final List<Journey> data;
  final Links links;
  final Meta meta;

  JourneysDriverResp(this.data, this.links, this.meta);

  static JourneysDriverResp fromJson(Map<String, dynamic> parsedJson) {
    List<Journey> temp = [];
    if (parsedJson["data"] != null) {
      for (int i = 0; i < parsedJson['data'].length; i++) {
        Journey journey = Journey.fromJson(parsedJson['data'][i]);
        temp.add(journey);
      }
    }
    return JourneysDriverResp(
      temp,
      parsedJson["links"] != null ? Links.fromJson(parsedJson["links"]) : null,
      parsedJson["meta"] != null ? Meta.fromJson(parsedJson["meta"]) : null,
    );
  }
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
    List<User> passengersTemp = [];
    if (parsedJson["passengers"] != null) {
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
  List<Object> get props =>
      [
        id,
        comment,
        matchedAt,
        confirmed,
        endedAt,
        initiatorID,
        destinationID,
        startID,
        driverID,
        createdAt,
        updatedAt,
        driverMessage,
        initiator,
        passengers,
        destination,
        start,
        driver,
      ];

  @override
  String toString() {
    return 'Journey { id: $id, comment: $comment, matched_at: $matchedAt, confirmed: $confirmed, ended_at: $endedAt, initiator_id: $initiatorID, destination_id: $destinationID, start_id: $startID, driver_id: $driverID, created_at: $createdAt, updated_at: $updatedAt, driver_message: $driverMessage, initiator: $initiator, passengers: ${passengers
        .toString()}, destination: $destination, start: $start, driver: $driver }';
  }
}

@immutable
class MitfahrbaenkeResp extends Equatable {
  final List<Mitfahrbank> mitfahrbaenke;

  MitfahrbaenkeResp(this.mitfahrbaenke);

  static MitfahrbaenkeResp fromJson(List<dynamic> parsedJson) {
    List<Mitfahrbank> mitfahrbaenkeTemp = [];
    if (parsedJson.length > 0) {
      for (int i = 0; i < parsedJson.length; i++) {
        Mitfahrbank mitfahrbank = Mitfahrbank.fromJson(parsedJson[i]);
        mitfahrbaenkeTemp.add(mitfahrbank);
      }
    }

    return MitfahrbaenkeResp(mitfahrbaenkeTemp);
  }

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'MitfahrbaenkeResp {  }';
  }
}

@immutable
class DestinationMitfahrbaenkeResp {
  final List<Mitfahrbank> data;

  DestinationMitfahrbaenkeResp(this.data);

  static DestinationMitfahrbaenkeResp fromJson(
      Map<String, dynamic> parsedJson) {
    List<Mitfahrbank> temp = [];
    if (parsedJson["data"] != null) {
      for (int i = 0; i < parsedJson['data'].length; i++) {
        Mitfahrbank mitfahrbank = Mitfahrbank.fromJson(parsedJson['data'][i]);
        temp.add(mitfahrbank);
      }
    }
    return DestinationMitfahrbaenkeResp(temp);
  }
}

class JourneyStartPOST {
  final String destinationID;
  final int startID;
  final String comment;

  JourneyStartPOST(this.destinationID, this.startID, this.comment);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['comment'] = comment;
    json['destination_id'] = destinationID;
    json['start_id'] = startID;
    return json;
  }
}
