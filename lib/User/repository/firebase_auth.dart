import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signIn() async {
    // se solicita el cuadro de dialogo de con que cuenta se desea loggear
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    // se solicita el cuadro de dialogo de con que cuenta se desea loggear
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithCredential(
        //aqui se comprueba la autenticacion de la cuenta, que sea una cuenta real
        GoogleAuthProvider.getCredential(
            idToken: gSA.idToken, accessToken: gSA.accessToken));

    return user;
  }
}
