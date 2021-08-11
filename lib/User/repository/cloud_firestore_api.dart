import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app1/Place/model/place.dart';
import 'package:app1/Place/ui/widgets/card_image.dart';
import 'package:app1/User/model/user.dart';
import 'package:app1/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

//comenzamos a definir los parametros que lleva esa tabla
  //o collect tambien conocido en firestore
  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
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
        'urlImage': place.urlImage,
        'userOwner': _db.document(
            "${USERS}/${user.uid}"), //reference, me crea ese tipo de dato
      }).then((DocumentReference dr) {
        dr.get().then((DocumentSnapshot snapshot) {
          //ID Place REFERENCIA ARRAY
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myPlaces': FieldValue.arrayUnion(//agregando elementos al array
                [_db.document("${PLACES}/${snapshot.documentID}")])
          });
        });
      });
    });
  }

//preparando la lista de los lugares recibidos en el snapshot
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    placesListSnapshot.forEach((p) {
      //se crea el ciclo para que se repita mientras encuentra tados
      profilePlaces.add(ProfilePlace(
        Place(
            name: p.data['name'],
            description: p.data['description'],
            urlImage: p.data['urlImage'],
            likes: p.data['likes']),
      ));
    });

    return profilePlaces;
  }

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, User user) {
    List<Place> places = List<Place>();

    placesListSnapshot.forEach((p) {
      Place place = Place(
          id: p.documentID,
          name: p.data["name"],
          description: p.data["description"],
          urlImage: p.data["urlImage"],
          likes: p.data["likes"]);
      List usersLikedRefs = p.data["usersLiked"];
      place.liked = false;
      usersLikedRefs?.forEach((drUL) {
        if (user.uid == drUL.documentID) {
          place.liked = true;
        }
      });
      places.add(place);
    });
    return places;
  }

  Future likePlace(Place place, String uid) async {
    await _db
        .collection(PLACES)
        .document(place.id)
        .get()
        .then((DocumentSnapshot ds) {
      int likes = ds.data["likes"];

      _db.collection(PLACES).document(place.id).updateData({
        'likes': place.liked ? likes + 1 : likes - 1,
        'usersLiked': place.liked
            ? FieldValue.arrayUnion([_db.document("${USERS}/${uid}")])
            : FieldValue.arrayRemove([_db.document("${USERS}/${uid}")])
      });
    });
  }
}
