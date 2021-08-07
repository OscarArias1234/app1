import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  //ACA SIMPLEMENTE SE CREAN LOS PARAMETROS GENERALES PARA PODER CREAR UN BOTTON
  //REUSABLE PARA CUALQUIER VISTA DONDE SE LLAME Y SE LE ENVIEN LOS PARAETROS
  double widthButton = 0.0;
  double heigthButton = 0.0;
  final String nameButton; //al ser requerida debe ser de tipo final
  final VoidCallback
      onPressed; //cuando se define este tipo de dato se convierte en una variable que puede recibir una funcion como parametro

  ButtonGreen({
    Key? key,
    required this.nameButton,
    required this.onPressed,
    required this.heigthButton,
    required this.widthButton,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonGreen();
  }
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget
          .onPressed, //el parametro widget. es para poder acceder a los elementos de otra clase desde una clase inert
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: widget.heigthButton,
        width: widget.widthButton,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFFa7ff84), //arriba //izquierda
                  Color(0xFF1cbb78) //abajo //derecha
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.nameButton,
            style: TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
