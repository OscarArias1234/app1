import 'package:app1/Place/model/place.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app1/User/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreAPI {
  //estas son las tabals de la base de datos
  //tambien conocidas como colecciones en firestore
  final String USERS = "users";
  final String PLACES = "places";

  //vamos a definir nuestra entidad base de datos
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //vamos a crear el metodo para insertar datos
//comenzamos a definir los parametros que lleva esa tabla
  //o collect tambien conocido en firestore
  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    //este es el equivalente a pasar los datos como map
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
    //esto equivale a hacer un commit a la base de datos
    //lo que quiere decir que si es correcto, se aplique a la bd
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);

    await _auth.currentUser().then((FirebaseUser user) {
      refPlaces.add({
        'name': place.name,
        'description': place.description,
        'likes': place.likes,
        'userOwner':
            "${USERS}/${user.uid}", //aqui le decimos la ruta para obtener el identificador del usaurio
      });
    }); //consulta del usuario que esta logueado
  }
}
