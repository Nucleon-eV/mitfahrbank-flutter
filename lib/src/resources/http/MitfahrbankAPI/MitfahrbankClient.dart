import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/journey_model.dart';
import '../../../models/user_model.dart';
import '../../../resources/UserRepository.dart';

class MitfahrbankClient {
  final String baseUrl;
  final UserRepository userRepository;
  final http.Client httpClient;

  MitfahrbankClient(this.userRepository, {
    http.Client httpClient,
    this.baseUrl = "https://mitfahrbank.digital/api",
  }) : this.httpClient = httpClient ?? http.Client();

  Future<Map<String, String>> authHeaders() async {
    String token = await this.userRepository.getToken();
    return {'Authorization': 'Bearer $token'};
  }


  Future<http.Response> _get(String path) async =>
      await httpClient.get(
          Uri.parse("$baseUrl$path"), headers: await authHeaders());

  Future<User> getUser() async {
    final response = await _get("/user");

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return User.fromJson(results);
    } else {
      throw Exception("Unable to get User");
    }
  }

  Future<JourneyResp> getJourney(int id) async {
    http.Response response = await _get("/user/journeys/$id");

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
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

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return JourneysDriverResp.fromJson(results);
    } else {
      throw Exception("Unable to get Journey");
    }
  }

  // TODO add pagination
  Future<JourneysDriverResp> getJourneysAsPassenger() async {
    http.Response response = await _get("/user/journeys");

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return JourneysDriverResp.fromJson(results);
    } else {
      throw Exception("Unable to get Journey");
    }
  }
}
