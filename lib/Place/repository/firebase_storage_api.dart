import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
  final StorageReference _storageReference = FirebaseStorage.instance.ref();
  //esto obtiene una referencia que corresponde a la url de firestorage

  Future<StorageUploadTask> uploadFile(String path, File image) async {
    return _storageReference.child(path).putFile(image);
  }
}//despues de crear siempre la api, se crea el repository
