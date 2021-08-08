import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:app1/User/model/user.dart';
import 'package:app1/User/bloc/bloc_user.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  //el fin del llamado del metodo Bloc es reutilizar los metodos que ya se estan con informacion almacenada
  //para poder hacer uso de esa informacion por medio del seguimiento y mostrarla
  UserBloc userBloc;
  User user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    //este stream lo que hace es estar atento al movimiento de los datos

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //se debe monitorear el objeto snapshot,
        switch (snapshot.connectionState) {
          //primero el estado de la coneccion
          case ConnectionState.waiting: //validando en que estado se encuentra
            return CircularProgressIndicator();
          case ConnectionState.none: //si esta iniciando la coneccion
            return CircularProgressIndicator();
          case ConnectionState.active: //si esta iniciada
            return showProfileData(snapshot);
          case ConnectionState.done: //si fue termianda
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la información. Haz login")
          ],
        ),
      );
    } else {
      print("Logeado");
      print(snapshot.data);
      user = User(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl);
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}
