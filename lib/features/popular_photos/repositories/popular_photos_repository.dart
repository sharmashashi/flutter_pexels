import 'package:flutter_pexels/core/services/http/http_service_impl.dart';
import 'package:flutter_pexels/features/popular_photos/models/popular_photos_response.dart';
import 'package:flutter_pexels/features/popular_photos/repositories/popular_photos_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularPhotosRepositoryProvider =
    Provider<PopularPhotosRepository>((ref) {
  return PopularPhotosRepositoryImpl(ref.read(httpServiceProvider));
});

abstract class PopularPhotosRepository {
  String get path;
  String get apiKey;
  Future<PopularPhotosResponse> getPopularPhotos({int perPage = 50, int page = 1});
}
