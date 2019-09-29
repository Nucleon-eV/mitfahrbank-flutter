import 'package:flutter/material.dart';
import 'package:mitfahrbank/src/ui/helper/BodyScaffold.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO replace "User" with real data
      body: BodyScaffold(title: "Hallo User", child: Container(),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.thumb_up),
            title: new Text('Mitfahren'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.directions_car),
            title: new Text('Mitnehmen'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Menü'))
        ],
      ),
    );
  }
}
