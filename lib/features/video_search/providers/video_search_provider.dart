import 'package:flutter_pexels/core/models/paginated_data.dart';
import 'package:flutter_pexels/features/popular_videos/models/popular_videos_response.dart';
import 'package:flutter_pexels/features/popular_videos/models/video.dart';
import 'package:flutter_pexels/features/video_search/providers/query_provider.dart';
import 'package:flutter_pexels/features/video_search/repositories/video_search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'video_search_provider.g.dart';

@riverpod
class VideoSearch extends _$VideoSearch {
  @override
  Future<PaginatedData<Video>> build() async {
    final videosResponse = await _fetch();

    return PaginatedData<Video>().copyWith(
        results: videosResponse.videos,
        page: videosResponse.page,
        nextPage: videosResponse.page + 1);
  }

  Future<PopularVideosResponse> _fetch({int page = 1}) async {
    final query = ref.watch(videoQueryProvider);
    final videoResponse = await ref
        .read(videoSearchRepositoryProvider)
        .searchVideos(page: page, perPage: 1, query: query);
    return videoResponse;
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
