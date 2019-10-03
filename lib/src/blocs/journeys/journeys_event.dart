import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class JourneysEvent extends Equatable {
  final List props;

  JourneysEvent([this.props = const []]);
}

class LoadJourneysAsDriver extends JourneysEvent {
  @override
  String toString() => 'LoadJourneysAsDriver';
}

class LoadJourneysAsPassenger extends JourneysEvent {
  @override
  String toString() => 'LoadJourneysAsPassenger';
}
