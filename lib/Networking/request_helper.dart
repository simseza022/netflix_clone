import 'package:popcorn_flix/Networking/network_helper.dart';

class RequestHelper{
  String rapidApiUrl = 'moviesdatabase.p.rapidapi.com';
  dynamic getCategoryMovies(String category){
    // titleType=movie&startYear=2010
    Map<String, dynamic> params =  {
      "list": category,
      "sort":"year.decr",
      "info": 'base_info'
    };
    final uri = Uri.https(rapidApiUrl,"/titles",params);
    print(uri.toString());
    var mov = NetworkHelper(uri).getData();
    print(mov);
    return mov;
  }

  dynamic getUpcomingMovies(){
    Map<String, dynamic> params =  {
      "info": 'base_info',
      "sort":"year.decr"
    };
    final uri = Uri.https(rapidApiUrl,"/titles/x/upcoming");
    print(uri.toString());
    var mov = NetworkHelper(uri).getData();
    print(mov);
    return mov;
  }





}
main(){
  // RequestHelper().getMovies(2);
}

