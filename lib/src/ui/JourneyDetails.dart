import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/journeys/journeys_bloc.dart';
import '../blocs/journeys/journeys_state.dart';
import '../models/journey_model.dart';
import 'LoadingIndicator.dart';

class JourneyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JourneysBloc, JourneysState>(
      builder: (context, state) {
        if (state is JourneysLoading) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  "",
                  style: TextStyle(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    //fontWeight: FontWeight.bold,
                    //fontSize: 30,
                  ),
                ),
              ),
              body: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/map-01.png",
                    fit: BoxFit.fill,
                  ),
                  LoadingIndicator(
                    inner: true,
                  ),
                ],
              ));
        } else if (state is JourneyLoaded) {
          Journey journey = state.journey;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "${journey.start.name} -> ${journey.destination.name}",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  //fontWeight: FontWeight.bold,
                  //fontSize: 30,
                ),
              ),
            ),
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
                      "${journey.start.name} -> ${journey.destination.name}",
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
                  child: Padding(
                    padding: EdgeInsets.only(top: 185),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          DateFormat.yMMMMd('de_DE').format(
                            DateTime.fromMillisecondsSinceEpoch(
                              (journey.endedAt != null
                                  ? journey.endedAt
                                  : journey.createdAt) *
                                  1000,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: ListView(
                            children: <Widget>[
                              Card(
                                margin: EdgeInsets.all(1),
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
                                margin: EdgeInsets.all(1),
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
                                margin: EdgeInsets.all(1),
                                child: ListTile(
                                  leading: Icon(Icons.access_time),
                                  title: Text(
                                    "${DateFormat.Hm().format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            journey.createdAt * 1000))} Uhr",
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
                              Visibility(
                                visible: journey.matchedAt != null,
                                child: Card(
                                  margin: EdgeInsets.all(1),
                                  child: ListTile(
                                    leading: Icon(Icons.access_time),
                                    title: Text(
                                      "${DateFormat.Hm().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              (journey.matchedAt != null
                                                  ? journey.matchedAt
                                                  : 0) * 1000))} Uhr",
                                    ),
                                    subtitle: Text(
                                      "Fahrer gefunden",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: journey.matchedAt != null,
                                child: SizedBox(
                                  height: 8,
                                ),
                              ),
                              Visibility(
                                visible: journey.endedAt != null,
                                child: Card(
                                  margin: EdgeInsets.all(1),
                                  child: ListTile(
                                    leading: Icon(Icons.access_time),
                                    title: Text(
                                      "${DateFormat.Hm().format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              (journey.endedAt != null ? journey
                                                  .endedAt : 0) * 1000))} Uhr",
                                    ),
                                    subtitle: Text(
                                      "Ankunft",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: journey.endedAt != null,
                                child: SizedBox(
                                  height: 8,
                                ),
                              ),
                              Visibility(
                                visible: journey.driver != null,
                                child: Card(
                                  margin: EdgeInsets.all(1),
                                  child: ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text(
                                      "${journey.driver != null ? journey.driver
                                          .firstName : ""} ${journey.driver !=
                                          null ? journey.driver.lastName : ""}",
                                    ),
                                    subtitle: Text(
                                      "Fahrer",
                                      style: TextStyle(color: Colors.grey),
                                    ),
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
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
