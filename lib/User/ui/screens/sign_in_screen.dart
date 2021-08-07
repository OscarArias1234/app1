import 'package:app1/widgets/button_green.dart';
import 'package:flutter/material.dart';
import '/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
            children: <Widget>[
              Text(
                "Bienvenido a la Primer APP Flutter",
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato-Bold",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ButtonGreen(
                nameButton: "Login with Gmail",
                onPressed: () {},
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
