// @dart=2.9
import 'dart:async';
import 'package:app1/User/bloc/bloc_user.dart';
import 'package:app1/User/ui/screens/sign_in_screen.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'platzi_trips.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //acomodamos de fora global los providers para poder acceder facilmente a ellos
    return BlocProvider(
      child: MaterialApp(
        //de esta forma implementamos los providers y toda la logica de user bloc
        //puede ser accedida a todos los hijos de material app
        debugShowCheckedModeBanner: false, // poner el banner DEBUG oculto
        title: 'Flutter App Curso',
        home: SignInScreen(),
        //PlatziTrips(),
      ),
      bloc: UserBloc(),
    );
  }
}
