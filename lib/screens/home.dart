import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/popular_photos/widget/popular_photos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: PopularPhotos());
  }
}
