import 'package:flutter_pexels/core/services/http/http_service_impl.dart';
import 'package:flutter_pexels/features/photo_search/repositories/photo_search_repository_impl.dart';
import 'package:flutter_pexels/features/popular_photos/models/popular_photos_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final photoSearchRepositoryProvider = Provider<PhotoSearchRepository>((ref) {
  return PhotoSearchRepositoryImpl(ref.read(httpServiceProvider));
});

abstract class PhotoSearchRepository {
  String get photoPath;

  Future<PopularPhotosResponse> searchPhotos(
      {int page = 1, int perPage = 50, required String query});
}
