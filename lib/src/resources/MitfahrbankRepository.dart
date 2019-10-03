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
}
