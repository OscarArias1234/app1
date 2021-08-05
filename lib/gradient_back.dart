import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";

  GradientBack(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF4268D3), Color(0xFF584CD1)],

              //estas son las indicaciones de los cruces de los colores
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6], //orientacion del gradiente
              tileMode: TileMode
                  .clamp)), //color de relleno cuando no cargue el gradiente
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato-Bold",
            fontWeight: FontWeight.bold),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}
