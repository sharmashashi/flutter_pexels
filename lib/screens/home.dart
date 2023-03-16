import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/popular_photos/models/popular_photos_response.dart';
import 'package:flutter_pexels/features/popular_photos/repositories/popular_photos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(popularPhotosProvider);
    return Scaffold(
      body: photos.when(
          data: ((data) {
            return ListView.builder(
                itemCount: data.photos.length,
                itemBuilder: ((context, index) {
                  return Image.network(data.photos[index].source.portrait ?? "");
                }));
          }),
          error: ((error, stackTrace) {
            return const Center(
              child: Text("Something went wrong!"),
            );
          }),
          loading: (() => const Center(
                child: CircularProgressIndicator(),
              ))),
    );
  }
}

final popularPhotosProvider =
    FutureProvider<PopularPhotosResponse>((ref) async {
  return await ref
      .read(popularPhotosRepositoryProvider)
      .getPopularPhotos(page: Random().nextInt(100));
});
