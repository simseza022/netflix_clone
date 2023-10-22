import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayer extends StatefulWidget {
  final String id;
  const TrailerPlayer({super.key, required this.id});

  @override
  State<TrailerPlayer> createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: widget.id,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: true,
          ),
        ),
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
      // _controller.addListener(listener);
      },
      ),
    );
  }
}
