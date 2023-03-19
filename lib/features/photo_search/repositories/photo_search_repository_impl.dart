import 'package:flutter_pexels/core/configs/configs.dart';
import 'package:flutter_pexels/core/services/http/http_service.dart';
import 'package:flutter_pexels/features/photo_search/repositories/photo_search_repository.dart';
import 'package:flutter_pexels/features/popular_photos/models/popular_photos_response.dart';

class PhotoSearchRepositoryImpl implements PhotoSearchRepository {
  HttpService httpService;
  PhotoSearchRepositoryImpl(this.httpService);
  @override
  String get photoPath => '/search';

  @override
  Future<PopularPhotosResponse> searchPhotos(
      {int page = 1, int perPage = 50, required String query}) async {
    final response = await httpService.get(Configs.baseUrl + photoPath,
        queryParameters: {
          'page': '$page',
          'perPage': '$perPage',
          'query': query
        });
    return PopularPhotosResponse.fromJson(response);
  }
}
