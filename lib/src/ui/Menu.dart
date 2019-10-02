import 'package:flutter/material.dart';
import 'package:mitfahrbank/src/ui/Home.dart';
import 'package:mitfahrbank/src/ui/helper/BodyScaffold.dart';

import 'Mitnehmen.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO replace "User" with real data
      body: BodyScaffold(
        title: "menu",
        child: Container(),
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
