import 'package:flutter_pexels/core/configs/configs.dart';
import 'package:flutter_pexels/core/services/http/http_service.dart';
import 'package:flutter_pexels/features/popular_photos/models/popular_photos_response.dart';
import 'package:flutter_pexels/features/popular_photos/repositories/popular_photos_repository.dart';

class PopularPhotosRepositoryImpl implements PopularPhotosRepository {
  @override
  String get path => '/curated';

  PopularPhotosRepositoryImpl(this.httpService);

  final HttpService httpService;

  @override
  Future<PopularPhotosResponse> getPopularPhotos(
      {int perPage = 50, int page = 1}) async {
    final responseData = await httpService.get(Configs.baseUrl + path,
        queryParameters: {
          'perPage': perPage.toString(),
          'page': page.toString()
        });

    return PopularPhotosResponse.fromJson(responseData);
  }
}
