import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/journey_model.dart';
import '../../../models/user_model.dart';
import '../../../resources/UserRepository.dart';

@immutable
class HTTPException implements Exception {
  final String cause;

  HTTPException(this.cause);
}

class MitfahrbankClient {
  final String baseUrl;
  final UserRepository userRepository;
  final http.Client httpClient;

  MitfahrbankClient(this.userRepository, {
    http.Client httpClient,
    this.baseUrl = "https://mitfahrbank.digital/api",
  }) : this.httpClient = httpClient ?? http.Client();

  Future<Map<String, String>> _authHeaders() async {
    String token = await this.userRepository.getToken();
    return {'Authorization': 'Bearer $token'};
  }

  Future<Map<String, String>> _postHeaders() async {
    Map<String, String> authHeaders = await this._authHeaders();
    authHeaders["content-type"] = "application/json";
    return authHeaders;
  }

  Future<http.Response> _get(String path) async =>
      await httpClient
          .get(Uri.parse("$baseUrl$path"), headers: await _authHeaders());

  Future<http.Response> _post(String path, String body) async =>
      await httpClient.post(Uri.parse("$baseUrl$path"),
          headers: await _postHeaders(), body: body);

  Future<User> getUser() async {
    final response = await _get("/user");

    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      return User.fromJson(results);
    } else {
      throw Exception("Unable to get User");
    }
  }

  Future<JourneyResp> getJourney(int id) async {
    http.Response response = await _get("/user/journeys/$id");

    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      return JourneyResp.fromJson(results);
    } else {
      throw Exception("Unable to get Journey");
    }
  }

  Future<JourneysResp> getJourneys() async {
    http.Response response = await _get("/journeys");

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return JourneysResp.fromJson(results);
    } else {
      throw Exception("Unable to get Journey");
    }
  }

  // TODO add pagination
  Future<JourneysDriverResp> getJourneysAsDriver() async {
    http.Response response = await _get("/user/journeys/driver");

    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      return JourneysDriverResp.fromJson(results);
    } else {
      throw Exception("Unable to get Journey");
    }
  }

  // TODO add pagination
  Future<JourneysDriverResp> getJourneysAsPassenger() async {
    http.Response response = await _get("/user/journeys");

    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      return JourneysDriverResp.fromJson(results);
    } else {
      throw Exception("Unable to get Journey");
    }
  }

  Future<MitfahrbaenkeResp> findStartByCoordinates(double lat,
      double lon) async {
    http.Response response =
    await _get("/starts/coordinates?longitude=$lon&latitude=$lat");

    // ERROR/NOT FOUND ALSO RETURNS 200 :(
    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      if (results.length > 0) {
        return MitfahrbaenkeResp.fromJson(results);
      } else {
        throw HTTPException(
            "Es wurde keine Mitfahrbank in deiner Nähe gefunden");
      }
    } else {
      throw Exception("Unable to get Journey");
    }
  }

  Future<DestinationMitfahrbaenkeResp> findDestinationsByStart(
      String id) async {
    http.Response response = await _get("/starts/$id/destinations");

    // ERROR/NOT FOUND ALSO RETURNS 200 :(
    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      if (results.containsKey("data") && results["data"].length > 0) {
        return DestinationMitfahrbaenkeResp.fromJson(results);
      } else {
        throw HTTPException("Es wurde keine Ziele für eine Startbank gefunden");
      }
    } else {
      throw Exception("Unable to get Journey");
    }
  }

  Future startJourney(JourneyStartPOST body) async {
    http.Response response =
    await _post("/user/journeys", json.encode(body.toJson()));

    if (response.statusCode != 200) {
      throw Exception("Unable to start Journey");
    }
  }
}
