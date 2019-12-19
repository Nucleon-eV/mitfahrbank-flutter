import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/Authentication.dart';
import '../blocs/journeys/journeys_bloc.dart';
import '../blocs/journeys/journeys_event.dart';
import '../resources/MitfahrbankRepository.dart';
import 'Home.dart';
import 'Mitnehmen.dart';

class Menu extends StatelessWidget {
  final MitfahrbankRepository mitfahrbankRepository;

  const Menu({Key key, @required this.mitfahrbankRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Menü",
              style: TextStyle(
                color: Colors.grey,
                //fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                debugPrint("Profil");
              },
              child: Text(
                "Profil",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                debugPrint("Einstellungen");
              },
              child: Text(
                "Einstellungen",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                debugPrint("Informationen");
              },
              child: Text(
                "Informationen",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                debugPrint("Karte");
              },
              child: Text(
                "Karte",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                debugPrint("Account verifizieren");
              },
              child: Text(
                "Account verifizieren",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(LoggedOut());
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              },
              child: Text(
                "Ausloggen",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // this will be set when a new tab is tapped
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
          if (tab == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    BlocProvider<JourneysBloc>(
                      create: (context) {
                        return JourneysBloc(
                            mitfahrbankRepository: mitfahrbankRepository)
                          ..add(LoadJourneysAsPassenger());
                      },
                      child: Home(mitfahrbankRepository: mitfahrbankRepository),
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
