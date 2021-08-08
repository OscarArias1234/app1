import 'package:app1/User/bloc/bloc_user.dart';
import 'package:app1/widgets/button_green.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  late UserBloc userBolc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBolc = BlocProvider.of(context);
    return signInGoogleUI();
  }

  //es importante definirla como un widget aparte para poder monitorear la app desde el usaurio
  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", 10000.0),
          Column(
            //propiedad utilizada para centrar los elementos de forma vertical
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Bienvenido a la Primer APP Flutter",
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato-Bold",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              ButtonGreen(
                nameButton: "Login with Gmail",
                onPressed: () {
                  //con el metodo bloc lo vamos a llamar aca para hacer uso de la logica en el Caso 1.
                  userBolc.signIn().then((FirebaseUser user) =>
                      print("El usuario es ${user.displayName}"));
                },
                heigthButton: 50.0,
                widthButton: 300.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
