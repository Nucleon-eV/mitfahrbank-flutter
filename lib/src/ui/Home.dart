import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import './StartJourney.dart';
import '../blocs/journeys/journeys_bloc.dart';
import '../blocs/journeys/journeys_event.dart';
import '../blocs/journeys/journeys_state.dart';
import '../models/journey_model.dart';
import '../resources/MitfahrbankRepository.dart';
import 'JourneyDetails.dart';
import 'LoadingIndicator.dart';
import 'Menu.dart';
import 'Mitnehmen.dart';

// TODO add pull to refresh https://felangel.github.io/bloc/#/flutterweathertutorial?id=pull-to-refresh
class Home extends StatelessWidget {
  final MitfahrbankRepository mitfahrbankRepository;

  const Home({Key key, @required this.mitfahrbankRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  final List<Journey> journeys = state.journeys;
                  final Journey activeJourney = state.activeJourney;

                  return Padding(
                    padding: EdgeInsets.only(top: 185),
                    child: Column(
                      children: <Widget>[
                        Visibility(
                          visible: activeJourney == null,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: ButtonTheme(
                              minWidth: double.infinity,
                              height: 45,
                              child: FlatButton(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          StartJourney(
                                            mitfahrbankRepository:
                                            mitfahrbankRepository,
                                          ),
                                    ),
                                  );
                                },
                                child: Text("Jetzt mitfahren"),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Visibility(
                          visible: activeJourney != null,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Aktive Fahrt".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Card(
                                margin: EdgeInsets.all(1),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider<JourneysBloc>(
                                              create: (context) {
                                                return JourneysBloc(
                                                  mitfahrbankRepository:
                                                  mitfahrbankRepository,
                                                )
                                                  ..add(
                                                    LoadJourney(
                                                      activeJourney.id,
                                                    ),
                                                  );
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
                                        leading: Icon(
                                          Icons.directions_car,
                                          color: Theme
                                              .of(context)
                                              .primaryColor,
                                        ),
                                        title: Text(
                                            "${activeJourney != null
                                                ? activeJourney.start.name
                                                : ""} -> ${activeJourney != null
                                                ? activeJourney.destination.name
                                                : ""}"),
                                        subtitle: Text(
                                          "${DateFormat.Hm('de_DE').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                              (activeJourney != null
                                                  ? activeJourney.createdAt
                                                  : 0) *
                                                  1000,
                                            ),
                                          )} Uhr",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Letzte Fahrten".toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: ListView.separated(
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
                                              create: (context) {
                                                return JourneysBloc(
                                                  mitfahrbankRepository:
                                                  mitfahrbankRepository,
                                                )
                                                  ..add(
                                                    LoadJourney(
                                                      journeys[index].id,
                                                    ),
                                                  );
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
                      create: (context) {
                        return JourneysBloc(
                            mitfahrbankRepository: mitfahrbankRepository)
                          ..add(LoadJourneysAsDriver());
                      },
                      child:
                      Mitnehmen(mitfahrbankRepository: mitfahrbankRepository),
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
