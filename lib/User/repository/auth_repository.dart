import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_api.dart';

class AuthRepository {
  //clase que contiene la logica como tal de repository como tal de control de datos, de autenticacion

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<FirebaseUser> signInFirebase() => _firebaseAuthAPI.signIn();
  //los future esperan recibir un dato a futuro

  signOut() => _firebaseAuthAPI.signOut();
  //responsabilidad de llamar el metodo de cierre
}
