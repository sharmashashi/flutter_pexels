import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'query_provider.g.dart';

@riverpod
class VideoQuery extends _$VideoQuery {
  @override
  String build() => 'Himalayas';
  update(String query) {
    state = query;
  }
}
