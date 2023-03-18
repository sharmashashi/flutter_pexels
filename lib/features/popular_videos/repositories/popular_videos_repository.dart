import 'package:flutter_pexels/core/services/http/http_service_impl.dart';
import 'package:flutter_pexels/features/popular_videos/models/popular_videos_response.dart';
import 'package:flutter_pexels/features/popular_videos/repositories/popular_videos_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularVideosRepositoryProvider =
    Provider<PopularVideosRepository>((ref) {
  return PopularVideosRepositoryImpl(ref.read(httpServiceProvider));
});

abstract class PopularVideosRepository {
  String get path;

  Future<PopularVideosResponse> getPopularVideos(
      {int page = 1, int perPage = 50});
}
