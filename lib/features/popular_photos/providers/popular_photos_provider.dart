import 'package:flutter_pexels/core/models/paginated_data.dart';
import 'package:flutter_pexels/features/popular_photos/models/photo.dart';
import 'package:flutter_pexels/features/popular_photos/models/popular_photos_response.dart';
import 'package:flutter_pexels/features/popular_photos/repositories/popular_photos_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'popular_photos_provider.g.dart';

@riverpod
class PopularPhotos extends _$PopularPhotos {
  @override
  Future<PaginatedData<Photo>> build() async {
    final photosResponse = await _fetch();

    return PaginatedData<Photo>().copyWith(
        results: photosResponse.photos,
        page: photosResponse.page,
        nextPage: photosResponse.page + 1);
  }

  Future<PopularPhotosResponse> _fetch({int page = 1}) async {
    final photosResponse = await ref
        .read(popularPhotosRepositoryProvider)
        .getPopularPhotos(page: page, perPage: 1);
    return photosResponse;
  }

  fetchNext() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // state = const AsyncValue.loading();
    final stateValue = state.value!;
    final response = await _fetch(page: stateValue.nextPage);
    final value = stateValue.copyWith(
        results: [...stateValue.results, ...response.photos],
        page: response.page,
        nextPage: response.page + 1);
    state = AsyncValue.data(value);
  }
}
