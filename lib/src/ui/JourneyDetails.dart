import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/journeys/journeys_bloc.dart';
import '../blocs/journeys/journeys_event.dart';
import '../blocs/journeys/journeys_state.dart';
import '../models/journey_model.dart';
import '../resources/MitfahrbankRepository.dart';
import '../resources/UserRepository.dart';
import '../resources/http/MitfahrbankAPI/MitfahrbankClient.dart';
import 'LoadingIndicator.dart';
import 'helper/BodyScaffold.dart';

class JourneyDetails extends StatelessWidget {
  final int id;

  const JourneyDetails({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    final mitfahrbankRepository =
        MitfahrbankRepository(MitfahrbankClient(userRepository));

    // TODO: implement build
    return BlocProvider<JourneysBloc>(
      builder: (context) {
        return JourneysBloc(mitfahrbankRepository: mitfahrbankRepository)
          ..dispatch(LoadJourney(this.id));
      },
      child: BlocBuilder<JourneysBloc, JourneysState>(
        builder: (context, state) {
          if (state is JourneysLoading) {
            return Scaffold(
              body: BodyScaffold(
                title: "",
                child: LoadingIndicator(),
              ),
            );
          } else if (state is JourneyLoaded) {
            Journey journey = state.journey;
            return Scaffold(
              body: BodyScaffold(
                title: "${journey.start.name} -> ${journey.destination.name}",
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        DateFormat.yMMMMd('de_DE').format(
                          DateTime.fromMillisecondsSinceEpoch(
                            journey.endedAt * 1000,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Card(
                              margin: EdgeInsets.all(0),
                              child: ListTile(
                                leading: Icon(Icons.directions_bus),
                                title: Text(
                                  journey.start.name,
                                ),
                                subtitle: Text(
                                  "Mitfahrbank",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Card(
                              margin: EdgeInsets.all(0),
                              child: ListTile(
                                leading: Icon(Icons.directions),
                                title: Text(
                                  journey.destination.name,
                                ),
                                subtitle: Text(
                                  "Richtung",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Card(
                              margin: EdgeInsets.all(0),
                              child: ListTile(
                                leading: Icon(Icons.access_time),
                                title: Text(
                                  "${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(journey.createdAt * 1000))} Uhr",
                                ),
                                subtitle: Text(
                                  "Start",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Card(
                              margin: EdgeInsets.all(0),
                              child: ListTile(
                                leading: Icon(Icons.access_time),
                                title: Text(
                                  "${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(journey.matchedAt * 1000))} Uhr",
                                ),
                                subtitle: Text(
                                  "Fahrer gefunden",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Card(
                              margin: EdgeInsets.all(0),
                              child: ListTile(
                                leading: Icon(Icons.access_time),
                                title: Text(
                                  "${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(journey.endedAt * 1000))} Uhr",
                                ),
                                subtitle: Text(
                                  "Ankunft",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Card(
                              margin: EdgeInsets.all(0),
                              child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text(
                                  "${journey.driver.firstName} ${journey.driver.lastName}",
                                ),
                                subtitle: Text(
                                  "Fahrer",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
