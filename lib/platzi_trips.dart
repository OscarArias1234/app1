import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Place/ui/screens/home_trips.dart';
import 'Place/ui/screens/search_trips.dart';
import 'User/ui/screens/profile_trips.dart';

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    ProfileTrips()
  ];

  void onTapTapped(int index) {
    setState(() {
      //llamar la funcionalidad y controlar el estado del WIDGET
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      //se crea el curvednavigationbar para que tenga un mejor efecto la barra menu
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        color: Color(0xFF584CD1),
        backgroundColor: Colors.white,
        onTap: onTapTapped,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),

      body: widgetsChildren[indexTap],

      //inicializador del indice
      /* bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Colors.purple,
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          onTap: onTapTapped,
          // currentIndex: indexTap,
        ),
      ),*/
    );
  }
}
