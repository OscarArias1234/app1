import 'dart:ffi';

import 'package:app1/widgets/gradient_back.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AddPlaceScreen extends StatefulWidget {
  //vamos a preparar para recibir la foto y mostarla
  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(children: <Widget>[
        GradientBack("New Place", 300.0),
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 25.0, left: 5.0),
              child: SizedBox(
                height: 45.0,
                width: 45.0,
                child: IconButton(
                  onPressed: () {
                    //boton para devolver la ventana
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 45.0,
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
