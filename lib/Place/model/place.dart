import 'package:app1/User/model/user.dart';
import 'package:flutter/foundation.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  User userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    @required this.userOwner,
  });
}
