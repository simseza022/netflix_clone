



import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MovieDO1{
  late String id;
  late String title;
  late String posterUrl;
  late Map data;
  Widget? networkImage;

  // MovieDO1({required this.name, required this.image});


  void fromJson(Map json){
    id = json["id"];
    title = json["titleText"]["text"];
    posterUrl = json["primaryImage"]["url"];
    data = json;
    networkImage = Image.network(
      posterUrl,
      fit: BoxFit.cover,
    );
  }
  void addNetworkImage(Widget s){
    networkImage = s;
  }

}
