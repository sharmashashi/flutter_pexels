import 'package:flutter/material.dart';
import 'package:flutter_pexels/core/widgets/fake_search_bar.dart';
import 'package:flutter_pexels/features/popular_videos/providers/popular_videos_provider.dart';
import 'package:flutter_pexels/features/popular_videos/widget/video_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pexels/features/video_search/widget/video_search.dart'
    as video_search;

class PopularVideos extends ConsumerWidget {
  const PopularVideos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(popularVideosProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const video_search.VideoSearch(),
                ));
              },
              child: const FakeSearchBar()),
        ),
        Expanded(
          child: videos.when(
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
                  )),
        ),
      ],
    );
  }
}
