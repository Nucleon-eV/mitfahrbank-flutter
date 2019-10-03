import 'package:flutter/material.dart';
import 'package:mitfahrbank/src/ui/helper/BodyScaffold.dart';

import 'Home.dart';
import 'Menu.dart';

class Mitnehmen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO replace "User" with real data
      body: BodyScaffold(
        title: "Gutes tun",
        subtitle: DropdownButton(items: null, onChanged: null),
        child: Container(),
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
