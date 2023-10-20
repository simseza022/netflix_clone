import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popcorn_flix/dataObjects/movieDO.dart';

import '../Networking/request_helper.dart';

class MovieScreen extends StatefulWidget {
  final MovieDO movie;
  const MovieScreen({super.key, required this.movie});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen>{
  dynamic? directorsAndCreators;
  void getMovieDirectorsAndCreators() async{
    try{
        RequestHelper requestHelper = RequestHelper();
        await requestHelper.getMovieDirectorsAndCreators(widget.movie.id).then(
            (value){
              print(value);
              setState(() {
                directorsAndCreators = value['results'];
              });
            }
        );
    }catch(e){
      print("Error loading data: \n$e");
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    getMovieDirectorsAndCreators();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Container(
                height: 450,
                width: double.infinity,
                child: CachedNetworkImage(

                  imageUrl: widget.movie.posterUrl,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: Colors.redAccent, )),
                  errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.redAccent,),

                ),
              ),
            ),
            Positioned(
              top: 100,
              height: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Container(
                       width: 400,
                       child: Text(
                        widget.movie.title,
                        style: const TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                    ),
                     ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(9),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Rating: ${widget.movie.data['ratingsSummary']['aggregateRating']} (${widget.movie.data['ratingsSummary']['voteCount']})",
                            style: TextStyle(color: Colors.black),),
                        )
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/2,55)),
                            elevation: MaterialStateProperty.all<double>(20),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side:
                                        const BorderSide(color: Colors.red)))),
                        onPressed: () {},
                        child: const Text(
                          "Watch",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
             Positioned(
              top: 50,
              left: 25,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                      width: 1.5,
                      color: Colors.white54
                  ),
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
                    radius: 22,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                        color: Colors.white,
            ),
                    ),
                  ),
                ),
              ),),

          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Text(widget.movie.data['plot']['plotText']['plainText'],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          child: directorsAndCreators==null? Text("\nLoading data..."):
          Text("Director: ${directorsAndCreators['directors'][0]['credits'][0]['name']['nameText']['text']}"),
        )
      ]),
    );
  }
}
