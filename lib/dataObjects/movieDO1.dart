



class MovieDO1{
  late String id;
  late String title;
  late String posterUrl;


  // MovieDO1({required this.name, required this.image});


  void fromJson(Map json){
    id = json["id"];
    title = json["titleText"]["text"];
    posterUrl = json["primaryImage"]["url"];
  }

}
