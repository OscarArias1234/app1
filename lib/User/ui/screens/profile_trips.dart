import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:app1/User/bloc/bloc_user.dart';
import 'package:app1/User/model/user.dart';
import 'package:app1/User/ui/screens/profile_header.dart';
import 'package:app1/User/ui/widgets/profile_places_list.dart';
import 'package:app1/User/ui/widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      //crearemos un filtro para traer la informacion correspondiente solo al id que se encuentre logeado
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);

          default:
        }
      },
    );

    /*Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),//User datos
            ProfilePlacesList()//User uid

          ],
        ),
      ],
    );*/
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[Text("Usuario no logeado. Haz Login")],
          ),
        ],
      );
    } else {
      print("Logeado");
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl);

      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user), //User datos
              ProfilePlacesList(user) //User uid
            ],
          ),
        ],
      );
    }
  }
}
