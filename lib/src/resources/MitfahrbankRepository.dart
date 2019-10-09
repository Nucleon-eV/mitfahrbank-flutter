import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../models/journey_model.dart';
import '../models/user_model.dart';
import 'http/MitfahrbankAPI/MitfahrbankClient.dart';

class MitfahrbankRepository {
  final MitfahrbankClient client;

  MitfahrbankRepository(this.client);

  Future<User> search(String term) async {
    // TODO Use cache or something
    final result = await client.getUser();
    return result;
  }

  Future<Journey> getJourney(int id) async {
    // TODO Use cache or something
    final result = await client.getJourney(id);
    return result.data;
  }

  Future<List<Journey>> getJourneys() async {
    // TODO Use cache or something
    final result = await client.getJourneys();
    return result.data;
  }

  Future<List<Journey>> getJourneysAsDriver() async {
    // TODO Use cache or something
    final result = await client.getJourneysAsDriver();
    return result.data;
  }

  Future<List<Journey>> getJourneysAsPassenger() async {
    // TODO Use cache or something
    final result = await client.getJourneysAsPassenger();
    return result.data;
  }

  Future<Journey> getActiveJourneys() async {
    final result = await client.getActiveJourneys();
    return result.singleData;
  }

  Future<Tuple2<Map<int, String>, Map<String, DropdownMenuItem<String>>>>
  findStartByCoordinates(double lat, double lon) async {
    final result = await client.findStartByCoordinates(lat, lon);

    return Tuple2<Map<int, String>, Map<String, DropdownMenuItem<String>>>(
      Map.fromIterable(
        result.mitfahrbaenke,
        key: (item) => item.id,
        value: (v) => v.name,
      ),
      Map.fromIterable(
        result.mitfahrbaenke,
        key: (item) => item.id.toString(),
        value: (v) =>
            DropdownMenuItem(
              child: Text(v.name),
              value: v.id.toString(),
            ),
      ),
    );
  }

  Future<Tuple2<Map<int, String>, List<DropdownMenuItem<String>>>>
  findDestinationsByStart(String id) async {
    final result = await client.findDestinationsByStart(id);

    return Tuple2<Map<int, String>, List<DropdownMenuItem<String>>>(
      Map.fromIterable(
        result.data,
        key: (item) => item.id,
        value: (v) => v.name,
      ),
      result.data
          .map(
            (value) =>
            DropdownMenuItem(
              child: Text(value.name),
              value: value.id.toString(),
            ),
      )
          .toList(),
    );
  }

  Future startJourney(JourneyStartPOST body) {
    return client.startJourney(body);
  }
}
