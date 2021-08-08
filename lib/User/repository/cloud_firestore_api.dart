import 'package:flutter/material.dart';

import 'package:app1/User/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreAPI {
  //estas son las tabals de la base de datos
  //tambien conocidas como colecciones en firestore
  final String USERS = "users";
  final String PLACE = "places";

  //vamos a definir nuestra entidad base de datos
  final Firestore _db = Firestore.instance;

  //vamos a crear el metodo para insertar datos

  void updateUserData(User user) async {
    //comenzamos a definir los parametros que lleva esa tabla
    //o collect tambien conocido en firestore

    DocumentReference ref = _db.collection(USERS).document(user.uid);
    //este es el equivalente a pasar los datos como map
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now(),
    },
        //esto equivale a hacer un commit a la base de datos
        //lo que quiere decir que si es correcto, se aplique a la bd
        merge: true);
  }
}
