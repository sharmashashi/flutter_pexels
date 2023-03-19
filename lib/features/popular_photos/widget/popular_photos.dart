import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pexels/core/widgets/fake_search_bar.dart';
import 'package:flutter_pexels/features/popular_photos/providers/popular_photos_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pexels/features/photo_search/widget/photo_search.dart'
    as photo_search;

class PopularPhotos extends ConsumerWidget {
  const PopularPhotos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(popularPhotosProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const photo_search.PhotoSearch(),
                ));
              },
              child: const FakeSearchBar()),
        ),
        Expanded(
          child: photos.when(
              data: (data) => PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data.results.length,
                    itemBuilder: (context, index) {
                      if (index + 1 == data.results.length) {
                        ref.read(popularPhotosProvider.notifier).fetchNext();
                      }
                      return CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: data.results[index].source.original ?? "",
                        progressIndicatorBuilder: (context, url, progress) =>
                            Image.network(
                          data.results[index].source.medium ?? "",
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
              error: (err, stacktrace) => const Text("Something went wrong!"),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
        ),
      ],
    );
  }
}
