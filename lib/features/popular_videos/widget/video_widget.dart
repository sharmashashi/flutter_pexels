import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String url;
  const VideoWidget({required this.url, super.key});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  Widget player = const SizedBox();
  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.url)
      ..initialize().then((value) {
        chewieController = ChewieController(
            videoPlayerController: videoPlayerController,
            autoPlay: true,
            autoInitialize: true);

        setState(() {
          player = Chewie(controller: chewieController,
          );
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return player;
  }

  @override
  void dispose() {
    try {
      videoPlayerController.dispose();
      chewieController.dispose();
    } catch (_) {}
    super.dispose();
  }
}
