import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/journey_model.dart';
import '../../../models/user_model.dart';

class MitfahrbankClient {
  final String baseUrl;
  final String token;
  final http.Client httpClient;

  MitfahrbankClient(
    this.token, {
    http.Client httpClient,
    this.baseUrl = "https://mitfahrbank.digital/api",
  }) : this.httpClient = httpClient ?? http.Client();

  Map<String, String> get authHeaders =>
      {'Map<String, String>': 'Bearer ${this.token}'};

  Future<http.Response> _get(String path) async =>
      await httpClient.get(Uri.parse("$baseUrl$path"), headers: authHeaders);

  Future<User> getUser() async {
    final response = await _get("/user");

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return User.fromJson(results);
    } else {
      throw Exception("Unable to get User");
    }
  }

  Future<Journey> getJourney({int id}) async {
    http.Response response;
    if (id != null) {
      response = await _get("/starts/$id/journeys");
    } else {
      response = await _get("/journeys");
    }

    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return Journey.fromJson(results);
    } else {
      throw Exception("Unable to get Journey");
    }
  }
}
