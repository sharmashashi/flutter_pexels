import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_pexels/features/popular_videos/models/video.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final Video video;
  const VideoWidget({required this.video, super.key});

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
    videoPlayerController = VideoPlayerController.network(widget
        .video.videoFiles
        .firstWhere((element) => element.quality == 'hd')
        .link)
      ..initialize().then((value) {
        chewieController = ChewieController(
            videoPlayerController: videoPlayerController,
            autoPlay: true,
            autoInitialize: true);

        setState(() {
          player = Chewie(
            controller: chewieController,
          );
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: player),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(widget.video.url))) {
                  launchUrl(Uri.parse(widget.video.url));
                }
              },
              child: Text(
                'Video by ${widget.video.user.name} on Pexels',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(decoration: TextDecoration.underline),
              )),
        ),
      ],
    );
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
