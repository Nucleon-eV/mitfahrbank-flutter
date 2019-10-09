import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/journey_model.dart';

@immutable
abstract class JourneysState extends Equatable {
  final List props;

  JourneysState([this.props = const []]);
}

class JourneysLoading extends JourneysState {
  @override
  String toString() => 'JourneysLoading';
}

class JourneysAsDriverLoaded extends JourneysState {
  final List<Journey> journeys;

  JourneysAsDriverLoaded({
    @required this.journeys,
  }) : super([journeys]);

  @override
  String toString() => 'JourneysAsDriverLoaded { journeys: $journeys}';
}

class JourneysAsPassengerLoaded extends JourneysState {
  final List<Journey> journeys;
  final Journey activeJourney;

  JourneysAsPassengerLoaded({
    @required this.journeys,
    @required this.activeJourney,
  }) : super([journeys, activeJourney]);

  @override
  String toString() =>
      'JourneysAsPassengerLoaded { journeys: $journeys, activeJourney: $activeJourney  }';
}

class JourneyLoaded extends JourneysState {
  final Journey journey;

  JourneyLoaded({this.journey}) : super([journey]);

  @override
  String toString() => 'JourneyLoaded { journey: $journey }';
}

class JourneysNotLoaded extends JourneysState {
  @override
  String toString() => 'JourneysNotLoaded';
}
