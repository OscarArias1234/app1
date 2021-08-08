import 'package:app1/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

//desde aca llamaremos los repositorios de usuarios para hacer uso de la logica

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //vamos a declarar el flujo de datos "Stream"
  //Stream - Firebase
  //firebase ya trae su popio flujo de datos, pero de no traerlo podriamos trabajar la clase StreamController
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;
  //sirve para monitorear el estado de la sesion
  Stream<FirebaseUser> get authStatus => streamFirebase;
  //esta nos devuelve el estado de la sesion

  //Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signIn() {
    return _auth_repository.signInFirebase();
    //este es el metodo que se llama desde la interfaz de usuario
  }

  //2. signOut // llamando el apuntador del repositorio
  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
