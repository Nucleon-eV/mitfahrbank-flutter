import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/journeys/journeys_bloc.dart';
import '../blocs/journeys/journeys_event.dart';
import '../blocs/journeys/journeys_state.dart';
import '../resources/MitfahrbankRepository.dart';
import '../resources/UserRepository.dart';
import '../resources/http/MitfahrbankAPI/MitfahrbankClient.dart';
import 'Home.dart';
import 'JourneyDetails.dart';
import 'LoadingIndicator.dart';
import 'Menu.dart';
import 'helper/BodyScaffold.dart';

class Mitnehmen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    final mitfahrbankRepository =
    MitfahrbankRepository(MitfahrbankClient(userRepository));

    return Scaffold(
      // TODO replace "User" with real data
      body: BodyScaffold(
        title: "Gutes tun",
        //subtitle: DropdownButton(items: null, onChanged: null),
        child: BlocProvider<JourneysBloc>(
          builder: (context) {
            return JourneysBloc(mitfahrbankRepository: mitfahrbankRepository)
              ..dispatch(LoadJourneysAsDriver());
          },
          child: BlocBuilder<JourneysBloc, JourneysState>(
            builder: (context, state) {
              if (state is JourneysLoading) {
                return LoadingIndicator();
              } else if (state is JourneysAsDriverLoaded) {
                final journeys = state.journeys;

                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Zuletzt mitgenommen".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              margin: EdgeInsets.all(0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          JourneyDetails(
                                            id: journeys[index].id,
                                          ),
                                    ),
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.directions_car),
                                      title: Text(
                                          "${journeys[index].start
                                              .name} -> ${journeys[index]
                                              .destination.name}"),
                                      subtitle: Text(
                                        DateFormat.yMMMMd('de_DE').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            journeys[index].endedAt * 1000,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(),
                          itemCount: journeys.length,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // this will be set when a new tab is tapped
        onTap: (int tab) {
          if (tab == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
          if (tab == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            title: Text('Mitfahren'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            title: Text('Mitnehmen'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menü'),
          )
        ],
      ),
    );
  }
}
