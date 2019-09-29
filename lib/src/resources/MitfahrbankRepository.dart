import './http/MitfahrbankAPI/MitfahrbankClient.dart';
import '../models/journey_model.dart';
import '../models/user_model.dart';

class MitfahrbankRepository {
  final MitfahrbankClient client;

  MitfahrbankRepository(this.client);

  Future<User> search(String term) async {
    // TODO Use cache or something
    final result = await client.getUser();
    return result;
  }

  Future<Journey> getJourney({int id}) async {
    // TODO Use cache or something
    final result = await client.getJourney(id: id);
    return result;
  }
}
