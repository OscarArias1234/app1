import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:app1/Place/model/place.dart';
import 'package:app1/Place/repository/firebase_storage_repository.dart';
import 'package:app1/Place/ui/widgets/card_image.dart';
import 'package:app1/User/model/user.dart';
import 'package:app1/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app1/User/repository/cloud_firestore_api.dart';
import 'package:app1/User/repository/cloud_firestore_repository.dart';
import 'package:app1/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() => _auth_repository.signInFirebase();

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

//siempre debe estar activa en modo escucha no para vovler a llamar todos los datos
//sino para identificar que si algo fue agregado, debe mostrarlo inmediatamente
  Stream<QuerySnapshot> placesListStream = Firestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .snapshots(); //aca me trae todos los datos existentes
  Stream<QuerySnapshot> get placesStream =>
      placesListStream; //este stream nos permite acceder al anterior
  //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);
  List<Place> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot, User user) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);
  Future likePlace(Place place, String uid) =>
      _cloudFirestoreRepository.likePlace(place, uid);

  Stream<QuerySnapshot> myPlacesListSream(String uid) => Firestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .where("userOwner",
          isEqualTo: Firestore.instance
              .document("${CloudFirestoreAPI().USERS}/${uid}"))
      .snapshots();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);

  StreamController<Place> placeSelectedStreamController =
      StreamController<Place>();
  Stream<Place> get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink<Place> get placeSelectedSink => placeSelectedStreamController.sink;

//43
  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
