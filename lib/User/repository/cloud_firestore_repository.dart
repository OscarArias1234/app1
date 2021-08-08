import 'package:flutter/material.dart';
import 'package:app1/User/model/user.dart';
import 'package:app1/User/repository/cloud_firestore_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
}
