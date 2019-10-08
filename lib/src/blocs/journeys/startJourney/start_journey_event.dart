import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class StartJourneyEvent extends Equatable {
  final List props;

  StartJourneyEvent([this.props = const []]);
}

class StartButtonPressed extends StartJourneyEvent {
  final String destinationID;
  final int startID;
  final String comment;

  StartButtonPressed({
    @required this.destinationID,
    @required this.startID,
    @required this.comment,
  }) : super([destinationID, startID, comment]);

  @override
  String toString() =>
      'StartButtonPressed { destinationID: $destinationID, startID: $startID, comment: $comment }';
}

class GotLocation extends StartJourneyEvent {
  final double lat;
  final double lon;

  GotLocation({
    @required this.lat,
    @required this.lon,
  }) : super([lat, lon]);

  @override
  String toString() => 'GotLocation { lat: $lat, lon: $lon }';
}

class LocationDeniedError extends StartJourneyEvent {
  @override
  String toString() => 'LocationDeniedError {}';
}
