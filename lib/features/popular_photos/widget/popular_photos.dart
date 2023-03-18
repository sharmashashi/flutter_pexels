import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/popular_photos/providers/popular_photos_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularPhotos extends ConsumerWidget {
  const PopularPhotos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(popularPhotosProvider);

    return Stack(
      children: [
        photos.when(
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
      ],
    );
  }
}
