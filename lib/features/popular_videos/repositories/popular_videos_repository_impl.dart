import 'package:flutter_pexels/core/configs/configs.dart';
import 'package:flutter_pexels/core/services/http/http_service.dart';
import 'package:flutter_pexels/features/popular_videos/models/popular_videos_response.dart';
import 'package:flutter_pexels/features/popular_videos/repositories/popular_videos_repository.dart';

class PopularVideosRepositoryImpl implements PopularVideosRepository {
  final HttpService httpService;
  PopularVideosRepositoryImpl(this.httpService);

  @override
  Future<PopularVideosResponse> getPopularVideos(
      {int page = 1, int perPage = 50}) async {
    final response = await httpService.get(Configs.baseUrl + path,
        queryParameters: {'page': '$page', 'perPage': '$perPage'});
    return PopularVideosResponse.fromJson(response);
  }

  @override
  String get path => '/videos/popular';
}
