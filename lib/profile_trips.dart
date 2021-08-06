import 'package:app1/gradient_back.dart';
import 'package:flutter/material.dart';

import 'header_appbar.dart';
//import 'profile_header.dart';
//import 'profile_places_list.dart';
//import 'profile_background.dart';

class ProfileTrips extends StatelessWidget {
  String pathImage = "assets/img/people.jpg";
  String name = "Varuna Yasas";
  String email = "";

  ProfileTrips(this.pathImage, this.name, this.email);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final userInfo = Container(
      margin: EdgeInsets.only(top: 8.0, left: 15.0),
      child: Text(
        email,
        textAlign: TextAlign.left,
        style:
            TextStyle(fontFamily: "Lato", fontSize: 18.0, color: Colors.grey),
      ),
    );

    final userName = Container(
      margin: EdgeInsets.only(top: 115.0, left: 10.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato-Bold", fontSize: 23.0, color: Colors.white),
      ),
    );
//todos los final anteriores estan contenidos aca en una columna para ser mostrados en vertical
    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(top: 100.0, left: 30.0),
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.white),
        shape: BoxShape.circle, //
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
        ),
      ),
    );

    final profiledetails = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        photo,
        Row(children: <Widget>[userDetails]),
      ],
    );

    return profiledetails;
  }
}
