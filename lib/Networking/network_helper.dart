import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper{
  final Uri uri;
  Map<String,String> headers = {
  'X-RapidAPI-Key': '16fd62e15bmsh1a5985ab3c6d0abp1df230jsn87d039aaf595',
  'X-RapidAPI-Host': 'streamlinewatch-streaming-guide.p.rapidapi.com'
  };

  NetworkHelper(this.uri);

  Future getData() async {
    http.Response response =  await http.get(uri, headers: headers);
    print('HHHHHHHHHhhhhhhhh');
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
    else{
      print(response.statusCode);
    }
  }
}