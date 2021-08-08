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
            //este es para cabiar la contrase;a
            CircleButton(
              true,
              Icons.vpn_key,
              20.0,
              Color.fromRGBO(255, 255, 255, 1),
              () => {},
            ),
            //para a;adir nuevo place
            CircleButton(
              false,
              Icons.add,
              40.0,
              Color.fromRGBO(255, 255, 255, 1),
              () => {},
            ),
            //para cerrar sesion
            CircleButton(
              true,
              Icons.exit_to_app,
              20.0,
              Color.fromRGBO(255, 255, 255, 0.6),
              () => {
                userBloc.signOut(),
              },
            ),
          ],
        ));
  }
}
