import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:mitfahrbank/src/models/login_model.dart';

class LoginProvider {
  Client client = Client();


  // TODO handle error response!
  Future<LoginRESPModel> doLogin(String email, String password) async {
    print("entered");
    final LoginPOSTModel loginBody = LoginPOSTModel(email, password);
    final response = await client.post(
        "https://mitfahrbank.digital/api/user/login",
        body: loginBody.toJson());
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return LoginRESPModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
