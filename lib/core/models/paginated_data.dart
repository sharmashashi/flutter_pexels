class PaginatedData<T> {
  final int page, nextPage;
  final List<T> results;
  PaginatedData({this.page = 1, this.results = const [], this.nextPage = 1});

  PaginatedData<T> copyWith({List<T>? results, int? nextPage, int? page}) {
    return PaginatedData(
        results: results ?? this.results,
        nextPage: nextPage ?? this.nextPage,
        page: page ?? this.page);
  }
}
