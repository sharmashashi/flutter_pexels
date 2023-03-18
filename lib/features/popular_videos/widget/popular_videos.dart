import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/popular_videos/providers/popular_videos_provider.dart';
import 'package:flutter_pexels/features/popular_videos/widget/video_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularVideos extends ConsumerWidget {
  const PopularVideos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(popularVideosProvider);
    return videos.when(
        data: (data) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.results.length,
            itemBuilder: (context, index) {
              if (index + 1 == data.results.length) {
                ref.read(popularVideosProvider.notifier).fetchNext();
              }

              return VideoWidget(
                  url: data.results[index].videoFiles
                      .firstWhere((element) => element.quality == 'hd')
                      .link);
            },
          );
        },
        error: (err, stacktrace) => const Text("Something went wrong!"),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
