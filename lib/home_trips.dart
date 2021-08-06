import 'package:app1/review_list.dart';
import 'package:flutter/material.dart';

import 'description_place.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget {
  //*****ESTAS VARIABLES SON TEMPORALES SIMULANDO UN ENVIO O RECEPCION DE DATOS***************
  String namePlace = "TITULO";
  int stars = 4;
  String descriptionPlace =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  //**************************** */

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      //estack para sobre poner elementos
      children: <Widget>[
        ListView(
          //list view para dejarlo deslizable o scroll
          children: <Widget>[
            DescriptionPlace(namePlace, stars, descriptionPlace),
            ReviewList(),
          ],
        ),
        HeaderAppBar("Home"),
      ],
    );
  }
}
