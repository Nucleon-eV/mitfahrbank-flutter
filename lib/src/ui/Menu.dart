import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/Authentication.dart';
import '../resources/UserRepository.dart';
import 'Home.dart';
import 'Mitnehmen.dart';
import 'login/Login.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
    BlocProvider.of<AuthenticationBloc>(context);

    final UserRepository userRepository = UserRepository();

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
                authenticationBloc.dispatch(LoggedOut());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage(userRepository: userRepository)),
                );
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
              MaterialPageRoute(builder: (context) => Mitnehmen()),
            );
          }
          if (tab == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
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
