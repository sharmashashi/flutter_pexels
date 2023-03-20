import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/popular_photos/providers/background_color_provider.dart';
import 'package:flutter_pexels/features/popular_photos/widget/popular_photos.dart';
import 'package:flutter_pexels/features/popular_videos/widget/popular_videos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = ref.watch(backgroundColorProvider);
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: PageView(
          children: const [PopularPhotos(), PopularVideos()],
        )));
  }
}
