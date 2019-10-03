import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mitfahrbank/src/models/journey_model.dart';

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

  JourneysAsDriverLoaded([this.journeys = const []]) : super([journeys]);

  @override
  String toString() => 'JourneysAsDriverLoaded { journeys: $journeys }';
}

class JourneysAsPassengerLoaded extends JourneysState {
  final List<Journey> journeys;

  JourneysAsPassengerLoaded([this.journeys = const []]) : super([journeys]);

  @override
  String toString() => 'JourneysAsPassengerLoaded { journeys: $journeys }';
}

class JourneysNotLoaded extends JourneysState {
  @override
  String toString() => 'JourneysNotLoaded';
}
