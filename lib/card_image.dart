import 'package:flutter/material.dart';
import 'floating_action_button_green.dart';
<<<<<<< HEAD

class  CardImage extends StatelessWidget {
=======
>>>>>>> 807d730 (se creo el boton flotante de favorito con las propiedades para enviar un mensaje emergente en un showBar y cambiar el icono segun sea la seleccion y se mostro correctamente en la app)

  String pathImage = "assets/img/beach.jpeg";

  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: EdgeInsets.only(
        top: 80.0,
        left: 20.0

      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage(pathImage)
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
<<<<<<< HEAD
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen()
      ],
=======
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[card, FloatingActionButtonGreen()],
>>>>>>> 807d730 (se creo el boton flotante de favorito con las propiedades para enviar un mensaje emergente en un showBar y cambiar el icono segun sea la seleccion y se mostro correctamente en la app)
    );
  }

}