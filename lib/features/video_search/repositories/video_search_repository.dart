import 'package:flutter_pexels/core/services/http/http_service_impl.dart';
import 'package:flutter_pexels/features/popular_videos/models/popular_videos_response.dart';
import 'package:flutter_pexels/features/video_search/repositories/video_search_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videoSearchRepositoryProvider = Provider<VideoSearchRepository>((ref) {
  return VideoSearchRepositoryImpl(ref.read(httpServiceProvider));
});

abstract class VideoSearchRepository {
  String get photoPath;

  Future<PopularVideosResponse> searchVideos(
      {int page = 1, int perPage = 50, required String query});
}
