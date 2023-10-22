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
      "sort":"year.incr",
      "genre": "Action"
    };
    final uri = Uri.https(rapidApiUrl,"/titles/x/upcoming", params);
    print(uri.toString());
    var mov = NetworkHelper(uri).getData();
    print(mov);
    return mov;
  }

  dynamic getMovieDirectorsAndCreators(String id){
    Map<String, dynamic> params =  {
      "info": "creators_directors_writers"
    };
    final uri = Uri.https(rapidApiUrl,"/titles/$id", params);
    var data = NetworkHelper(uri).getData();
    print(data);
    return data;
  }
  dynamic getMovieTrailer(String id){
    Map<String, dynamic> params =  {
      "info": "trailer"
    };
    final uri = Uri.https(rapidApiUrl,"/titles/$id", params);
    var data = NetworkHelper(uri).getData();
    print(uri.toString());
    return data;
  }

  dynamic searchMovies(String searchStr){
    Map<String, dynamic> params =  {
      "info": 'base_info',
      "sort":"year.incr",
    };
    final uri = Uri.https(rapidApiUrl,"/titles/search/title/$searchStr", params);
    var data = NetworkHelper(uri).getData();
    print(uri.toString());
    return data;
  }






}
main(){
  // RequestHelper().getMovies(2);
}

