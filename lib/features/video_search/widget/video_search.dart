import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/popular_photos/providers/background_color_provider.dart';
import 'package:flutter_pexels/features/popular_videos/widget/video_widget.dart';
import 'package:flutter_pexels/features/video_search/providers/query_provider.dart';
import 'package:flutter_pexels/features/video_search/providers/video_search_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoSearch extends ConsumerWidget {
  const VideoSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const border = OutlineInputBorder();
    final videos = ref.watch(videoSearchProvider);
    final backgroundColor = ref.watch(backgroundColorProvider);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                onSubmitted: (value) async {
                  ref.read(videoQueryProvider.notifier).update(value);
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    isDense: true,
                    focusedBorder: border,
                    enabledBorder: border),
              ),
            ),
            Expanded(
                child: videos.when(
                    data: (data) {
                      return PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: data.results.length,
                        itemBuilder: (context, index) {
                          if (index + 1 == data.results.length) {
                            ref.read(videoSearchProvider.notifier).fetchNext();
                          }
                          final video = data.results[index];
                          return VideoWidget(
                              video: video);
                        },
                      );
                    },
                    error: (err, stacktrace) =>
                        const Text("Something went wrong!"),
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        )))
          ],
        ),
      ),
    );
  }
}
