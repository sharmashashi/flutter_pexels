import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/popular_photos/repositories/popular_photos_repository.dart';
import 'package:flutter_pexels/features/popular_photos/widget/photo_card.dart';
import 'package:flutter_pexels/features/popular_photos/widget/popular_photos.dart';
import 'package:flutter_pexels/features/popular_videos/repositories/popular_videos_repository.dart';
import 'package:flutter_pexels/features/popular_videos/widget/popular_videos.dart';
import 'package:flutter_pexels/features/popular_videos/widget/video_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'repositories/fake_popular_photos_repository.dart';
import 'repositories/fake_popular_videos_repository.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  testWidgets('find one PhotoCard widget', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(ProviderScope(
          overrides: [
            popularPhotosRepositoryProvider
                .overrideWithValue(FakePopularPhotosRepository())
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: PopularPhotos(),
            ),
          )));

      await tester.pumpAndSettle();
    });

    expect(find.byType(PhotoCard), findsOneWidget);
  });

  testWidgets('find one VideoWdiget', (tester) async {
    await tester.runAsync(() async {
      await runZonedGuarded(() async {
        await tester.pumpWidget(ProviderScope(
            overrides: [
              popularVideosRepositoryProvider
                  .overrideWithValue(FakePopularVideosRepository())
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: PopularVideos(),
              ),
            )));

        await tester.pumpAndSettle();
      }, (error, stack) {});
    });

    expect(find.byType(VideoWidget), findsOneWidget);
  });
}
