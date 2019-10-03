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

class Mitnehmen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    final mitfahrbankRepository =
    MitfahrbankRepository(MitfahrbankClient(userRepository));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Mitnehmen",
          style: TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
            //fontWeight: FontWeight.bold,
            //fontSize: 30,
          ),
        ),
      ),
      // TODO replace "User" with real data
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/map-01.png",
            fit: BoxFit.fill,
            height: (MediaQuery
                .of(context)
                .size
                .height / 4) - 20,
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 130),
              child: Text(
                "Hallo User",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: BlocProvider<JourneysBloc>(
              builder: (context) {
                return JourneysBloc(
                    mitfahrbankRepository: mitfahrbankRepository)
                  ..dispatch(LoadJourneysAsDriver());
              },
              child: BlocBuilder<JourneysBloc, JourneysState>(
                builder: (context, state) {
                  if (state is JourneysLoading) {
                    return LoadingIndicator(
                      inner: true,
                    );
                  } else if (state is JourneysAsDriverLoaded) {
                    final journeys = state.journeys;

                    return Padding(
                      padding: EdgeInsets.only(top: 185),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Zuletzt mitgenommen".toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  margin: EdgeInsets.all(1),
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
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
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
                              separatorBuilder:
                                  (BuildContext context, int index) =>
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
        ],
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
