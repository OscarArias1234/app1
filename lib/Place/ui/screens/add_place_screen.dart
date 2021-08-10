import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app1/Place/ui/widgets/card_image.dart';
import 'package:app1/Place/ui/widgets/title_input_location.dart';
import 'package:app1/widgets/button_purple.dart';
import 'package:app1/widgets/gradient_back.dart';
import 'package:app1/widgets/text_input.dart';
import 'package:app1/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({Key key, this.image});

  @override
  State createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            height: 300.0,
          ),
          Row(
            //App Bar

            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 45,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
              Flexible(
                  child: Container(
                padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                child: TitleHeader(title: "Add a new Place"),
              ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              //nos da la posibilidad de hacer scrool si se desborda en vertical
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: "assets/img/sunset.jpeg", //widget.image.path,
                    iconData: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0, left: 0,
                  ),
                ), //Foto
                Container(
                  //TextField Title
                  //se crea un area segura para que no se salga del textfield o desborde el texto
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 1,
                    controller:
                        _controllerTitlePlace, //este controller nos captura los datos del textInput
                  ),
                ),
                TextInput(
                  //Description
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller:
                      _controllerDescriptionPlace, //este controller me captura todo lo del textInput de la description
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                      hintText: "Add Location", iconData: Icons.location_on),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: () {
                      //1. Firebase Storage
                      //url -

                      //2. Cloud Firestore
                      //Place - title, description, url, userOwner, likes
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
