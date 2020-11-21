import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tuple/tuple.dart';

import './LoadingIndicator.dart';
import '../blocs/journeys/startJourney/start_journey_bloc.dart';
import '../blocs/journeys/startJourney/start_journey_event.dart';
import '../blocs/journeys/startJourney/start_journey_state.dart';
import '../resources/MitfahrbankRepository.dart';

class StartJourney extends StatelessWidget {
  final MitfahrbankRepository mitfahrbankRepository;

  const StartJourney({Key key, this.mitfahrbankRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mitfahren",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
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
            height: (MediaQuery.of(context).size.height / 4) - 20,
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 130),
              child: Text(
                "Gutes tun",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 185),
            child: BlocProvider<StartJourneyBloc>(
              create: (context) {
                return StartJourneyBloc(
                  mitfahrbankRepository: mitfahrbankRepository,
                );
              },
              child: StartJourneyForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class StartJourneyForm extends StatefulWidget {
  @override
  _StartJourneyFormState createState() => _StartJourneyFormState();
}

class _StartJourneyFormState extends State<StartJourneyForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _commentController = new TextEditingController();

  Map<int, Tuple2<Map<int, String>, List<DropdownMenuItem<String>>>>
      destinationMitfahrbaenke;
  Map<int, String> startMitfahrbaenkeNames;
  int startMitfahrbankID;
  int destinationMitfahrbankID;
  bool hadGeo = false;

  Future _getLocation(StartJourneyBloc startJourneyBloc) async {
    LocationPermission geolocationStatus = await Geolocator.checkPermission();
    if (geolocationStatus == LocationPermission.denied) {
      startJourneyBloc.add(LocationDeniedError());
      return;
    }

    //Position position = await Geolocator()
    //    .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // debug code
    Position position =
        Position(latitude: 54.667904, longitude: 9.392943); // TARP

    startJourneyBloc
        .add(GotLocation(lat: position.latitude, lon: position.longitude));
    setState(() {
      hadGeo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _startJourneyBloc = BlocProvider.of<StartJourneyBloc>(context);
    if (startMitfahrbankID == null && !hadGeo) {
      _getLocation(_startJourneyBloc);
    }

    _onStartButtonPressed() async {
      // TODO dispatch loading first
      _startJourneyBloc.add(
        StartButtonPressed(
          comment: _commentController.text,
          startID: startMitfahrbankID,
          destinationID: destinationMitfahrbankID.toString(),
        ),
      );
    }

    return BlocListener<StartJourneyBloc, StartJourneyState>(
      listener: (context, state) {
        if (state is HTTPError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.errorMessage}'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is LocationDeniedErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Entschuldigung. Damit du mitfahren kannst brauchen wir deine Location um zu ermitteln ob du in der Nähe einer Mitfahrbank dich befindest.'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is JourneyStarted) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder<StartJourneyBloc, StartJourneyState>(
        builder: (
          BuildContext context,
          StartJourneyState state,
        ) {
          if (state is MitfahrbaenkeLoading) {
            return LoadingIndicator(
              inner: true,
            );
          }

          if (state is HTTPError &&
              state.errorMessage ==
                  "Es wurde keine Mitfahrbank in deiner Nähe gefunden") {
            return Container(
              margin: EdgeInsets.all(0),
              color: Colors.red,
              child: Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }

          // FIXME add labels!
          if (state is MitfahrbaenkeLoaded) {
            destinationMitfahrbaenke = state.destinationMitfahrbaenke;
            startMitfahrbaenkeNames = state.nameList;

            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: <Widget>[
                  FormField(
                    builder: (FormFieldState formState) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.directions_bus),
                          labelText: 'Mitfahrbank',
                        ),
                        isEmpty: startMitfahrbankID == null ? true : false,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isDense: true,
                            hint: startMitfahrbankID == null
                                ? null
                                : Text(startMitfahrbaenkeNames[
                                    startMitfahrbankID]),
                            items: state.startMitfahrbaenke,
                            onChanged: (String newValue) {
                              setState(() {
                                debugPrint("newValue: $newValue");
                                startMitfahrbankID = int.parse(newValue);
                                formState.didChange(newValue);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  FormField(
                    builder: (FormFieldState formState) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.directions),
                          labelText: 'Richtung',
                        ),
                        isEmpty:
                            destinationMitfahrbankID == null ? true : false,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isDense: true,
                            hint: (destinationMitfahrbankID == null ||
                                    startMitfahrbankID == null)
                                ? null
                                : Text(
                                    destinationMitfahrbaenke[startMitfahrbankID]
                                        .item1[destinationMitfahrbankID]),
                            items: startMitfahrbankID != null
                                ? destinationMitfahrbaenke[startMitfahrbankID]
                                    .item2
                                : null,
                            onChanged: (String newValue) {
                              setState(() {
                                debugPrint("newValue2: $newValue");
                                destinationMitfahrbankID = int.parse(newValue);
                                formState.didChange(newValue);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  TextFormField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.note),
                      hintText: 'Schreibe eine Notiz für den Fahrer',
                      labelText: 'Notiz',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                    child: ButtonTheme(
                      minWidth: double.infinity,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: state is! MitfahrbaenkeLoading
                            ? _onStartButtonPressed
                            : null,
                        child: Text('Mitfahrgelegenheit finden'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return LoadingIndicator(
            inner: true,
          );
        },
      ),
    );
  }
}
