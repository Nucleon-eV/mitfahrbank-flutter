import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/Authentication.dart';
import '../blocs/journeys/journeys_bloc.dart';
import '../blocs/journeys/journeys_event.dart';
import '../blocs/journeys/journeys_state.dart';
import '../resources/MitfahrbankRepository.dart';
import 'JourneyDetails.dart';
import 'LoadingIndicator.dart';
import 'Menu.dart';
import 'Mitnehmen.dart';


// TODO add pull to refresh https://felangel.github.io/bloc/#/flutterweathertutorial?id=pull-to-refresh
class Home extends StatelessWidget {
  final MitfahrbankRepository mitfahrbankRepository;
  final AuthenticationBloc authenticationBloc;

  const Home({Key key,
    @required this.mitfahrbankRepository,
    @required this.authenticationBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Mitfahren",
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
                "Gutes tun",
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
            child: BlocBuilder<JourneysBloc, JourneysState>(
              builder: (context, state) {
                if (state is JourneysLoading) {
                  return LoadingIndicator(
                    inner: true,
                  );
                } else if (state is JourneysAsPassengerLoaded) {
                  final journeys = state.journeys;

                  return Padding(
                    padding: EdgeInsets.only(top: 185),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Letzte Fahrten".toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
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
                                            BlocProvider<JourneysBloc>(
                                              builder: (context) {
                                                return JourneysBloc(
                                                    mitfahrbankRepository:
                                                    mitfahrbankRepository)
                                                  ..dispatch(LoadJourney(
                                                      journeys[index].id));
                                              },
                                              child: JourneyDetails(),
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
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(),
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: (int tab) {
          if (tab == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    BlocProvider<JourneysBloc>(
                      builder: (context) {
                        return JourneysBloc(
                            mitfahrbankRepository: mitfahrbankRepository)
                          ..dispatch(LoadJourneysAsDriver());
                      },
                      child: Mitnehmen(
                          mitfahrbankRepository: mitfahrbankRepository,
                          authenticationBloc: authenticationBloc),
                    ),
              ),
            );
          }
          if (tab == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Menu(
                      mitfahrbankRepository: mitfahrbankRepository,
                      authenticationBloc: authenticationBloc,
                    ),
              ),
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
