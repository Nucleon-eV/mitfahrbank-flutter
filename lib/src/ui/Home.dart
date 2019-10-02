import 'package:flutter/material.dart';
import 'package:mitfahrbank/src/ui/Menu.dart';
import 'package:mitfahrbank/src/ui/Mitnehmen.dart';
import 'package:mitfahrbank/src/ui/helper/BodyScaffold.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO replace "User" with real data
      body: BodyScaffold(
        title: "Hallo User",
        child: Container(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        onTap: (int tab) {
          if (tab == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Mitnehmen()),
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
