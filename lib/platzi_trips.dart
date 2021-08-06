import 'package:app1/profile_abbbar.dart';
import 'package:app1/profile_trips.dart';
import 'package:app1/search_trips.dart';
import 'package:flutter/material.dart';

import 'home_trips.dart';

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
    //lista para mostar las vistas de menu de navegacion
    HomeTrips(),
    SearchTrips(),
    ProfileAbbBar()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //**************CREAMOS LA BARRA DE NAVEGACION O MENU************************ */
    return Scaffold(
      body: widgetsChildren[indexTap], //inicializador del indice
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple,
        ),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text("")),
            ]),
      ),
    );
  }
}
