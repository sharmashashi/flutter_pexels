import 'package:flutter_pexels/core/models/paginated_data.dart';
import 'package:flutter_pexels/features/popular_videos/models/popular_videos_response.dart';
import 'package:flutter_pexels/features/popular_videos/models/video.dart';
import 'package:flutter_pexels/features/popular_videos/repositories/popular_videos_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'popular_videos_provider.g.dart';

@riverpod
class PopularVideos extends _$PopularVideos {
  @override
  Future<PaginatedData<Video>> build() async {
    final videosResponse = await _fetch();

    return PaginatedData<Video>().copyWith(
        results: videosResponse.videos,
        page: videosResponse.page,
        nextPage: videosResponse.page + 1);
  }

  Future<PopularVideosResponse> _fetch({int page = 1}) async {
    return await ref.read(popularVideosRepositoryProvider).getPopularVideos(page: page,perPage: 50);
  }

  fetchNext() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // state = const AsyncValue.loading();
    final stateValue = state.value!;
    final response = await _fetch(page: stateValue.nextPage);
    final value = stateValue.copyWith(
        results: [...stateValue.results, ...response.videos],
        page: response.page,
        nextPage: response.page + 1);
    state = AsyncValue.data(value);
  }
}
