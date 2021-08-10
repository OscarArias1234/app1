import 'dart:io';

import 'package:app1/Place/ui/screens/add_place_screen.dart';
import 'package:app1/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  //empezamos a acceder al UserBloc
  UserBloc userBloc; //la cual toca "instanciar" o llamar desde el metodo build

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            //Cambiar la contraseña
            CircleButton(true, Icons.vpn_key, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            //Añadiremos un nuevo lugar
            CircleButton(
                false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () {
              File image;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AddPlaceScreen(image: image)));
            }),

            //Cerrar Sesión
            CircleButton(true, Icons.exit_to_app, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {userBloc.signOut()}),
          ],
        ));
  }
}
