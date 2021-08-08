import 'package:flutter/material.dart';

class User {
  //en esta clase simplemente debemos tener en cuenta que datos debe recibir o se debe mostrar
  //que es lo que debe manejar el model
  final String name;
  final String email;
  final String photoURL;

  //estos son parametros que quiza no sean tan visibles, sin embargo son
  //manejables y manipulables a mostrar con en la interfaz y nos vilculariamos con
  //el modelo de places
  //myFavoritePlaces
  //myPlaces

  //ahora solo creamos el metodo constructor
  User({
    Key key,
    @required this.name,
    @required this.email,
    @required this.photoURL,
  });
}
