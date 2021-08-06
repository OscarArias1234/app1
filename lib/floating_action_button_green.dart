import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool _pressed = false;

  void onPressedFav() {
    setState(() {
      _pressed = !this._pressed;
    });

    Scaffold.of(context).showSnackBar(SnackBar(
        content: this._pressed
            ? Text("agregaste a favoritos")
            : Text("Eliminaste de Favoritos")));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(this._pressed ? Icons.favorite : Icons.favorite_border),
      //forma de validar si se ha presionado o se una el boolean
    );
  }
}
