import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

abstract class StartJourneyState extends Equatable {
  final List props;

  StartJourneyState([this.props = const []]);
}

class HTTPError extends StartJourneyState {
  final String errorMessage;

  HTTPError({this.errorMessage}) : super([errorMessage]);

  @override
  String toString() => 'JourneysLoading';
}

class LocationDeniedErrorState extends StartJourneyState {
  @override
  String toString() => 'LocationDeniedErrorState';
}

class MitfahrbaenkeLoading extends StartJourneyState {
  @override
  String toString() => 'MitfahrbaenkeLoading';
}

class MitfahrbaenkeLoaded extends StartJourneyState {
  final List<DropdownMenuItem<String>> startMitfahrbaenke;
  final Map<int, Tuple2<Map<int, String>, List<DropdownMenuItem<String>>>>
      destinationMitfahrbaenke;
  final Map<int, String> nameList;

  MitfahrbaenkeLoaded({
    this.startMitfahrbaenke,
    this.destinationMitfahrbaenke,
    this.nameList,
  }) : super([startMitfahrbaenke, destinationMitfahrbaenke, nameList]);

  @override
  String toString() =>
      'MitfahrbaenkeLoaded { startMitfahrbaenke: $startMitfahrbaenke, destinationMitfahrbaenke: $destinationMitfahrbaenke, nameList: $nameList }';
}

class JourneyStarted extends StartJourneyState {
  @override
  String toString() => 'JourneyStarted';
}
