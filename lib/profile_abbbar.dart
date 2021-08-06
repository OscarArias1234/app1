import 'package:app1/profile_trips.dart';
import 'package:flutter/material.dart';
import 'gradient_back.dart';

class ProfileAbbBar extends StatelessWidget {
  String titleView = "Profile";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(titleView),
        ProfileTrips(
            "assets/img/ann.png", "Eliza Carrillo", "elicarrit@gmail.com")
      ],
    );
  }
}
