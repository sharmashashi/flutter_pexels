import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/photo_search/providers/photo_search_provider.dart';
import 'package:flutter_pexels/features/photo_search/providers/query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoSearch extends ConsumerWidget {
  const PhotoSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const border = OutlineInputBorder();
    final photos = ref.watch(photoSearchProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                onSubmitted: (value) async {
                  ref.read(photoQueryProvider.notifier).update(value);
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
                child: photos.when(
                    data: (data) => PageView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: data.results.length,
                          itemBuilder: (context, index) {
                            if (index + 1 == data.results.length) {
                              ref
                                  .read(photoSearchProvider.notifier)
                                  .fetchNext();
                            }
                            return CachedNetworkImage(
                              fit: BoxFit.contain,
                              imageUrl:
                                  data.results[index].source.original ?? "",
                              progressIndicatorBuilder:
                                  (context, url, progress) => Image.network(
                                data.results[index].source.medium ?? "",
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
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
