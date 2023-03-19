import 'package:flutter_pexels/core/configs/configs.dart';
import 'package:flutter_pexels/core/services/http/http_service.dart';
import 'package:flutter_pexels/features/photo_search/repositories/photo_search_repository.dart';
import 'package:flutter_pexels/features/popular_videos/models/popular_videos_response.dart';
import 'package:flutter_pexels/features/video_search/repositories/video_search_repository.dart';

class VideoSearchRepositoryImpl implements VideoSearchRepository {
  HttpService httpService;
  VideoSearchRepositoryImpl(this.httpService);
  @override
  String get photoPath => '/videos/search';

  @override
  Future<PopularVideosResponse> searchVideos(
      {int page = 1, int perPage = 50, required String query}) async {
    final response = await httpService.get(Configs.baseUrl + photoPath,
        queryParameters: {
          'page': '$page',
          'perPage': '$perPage',
          'query': query
        });
    return PopularVideosResponse.fromJson(response);
  }
}
