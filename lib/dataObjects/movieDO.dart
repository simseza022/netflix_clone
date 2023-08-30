import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MovieDO{
  String name;
  AssetImage image;

  MovieDO({required this.name, required this.image});


  void fromJson(Map json){
    name = json["title"];
    image = json["ba"];
  }

}
