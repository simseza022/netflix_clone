import 'package:popcorn_flix/Networking/network_helper.dart';

class RequestHelper{
  String rapidApiUrl = 'streamlinewatch-streaming-guide.p.rapidapi.com';
  void getMovies() async{
    Map<String, dynamic> params =  {
    'region': 'US',
    'sort': 'popularity',
    'sources': 'netflix,hulu',
    'offset': '0',
    'limit': '1'
    };
    final uri = Uri.https(rapidApiUrl,"/movies",params);
    await NetworkHelper(uri).getData().then((value) => print(value));
  }


}
main(){
  RequestHelper().getMovies();
}

