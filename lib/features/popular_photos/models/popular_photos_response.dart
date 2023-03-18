import 'package:flutter_pexels/features/popular_photos/models/photo.dart';

class PopularPhotosResponse {
  final int page, perPage;
  final String nextPage;
  final List<Photo> photos;
  PopularPhotosResponse(
      {required this.nextPage,
      required this.page,
      required this.perPage,
      required this.photos});

  static PopularPhotosResponse fromJson(Map<String, dynamic> jsonDecoded) {
    return PopularPhotosResponse(
        nextPage: jsonDecoded['next_page'],
        page: jsonDecoded['page'],
        perPage: jsonDecoded['per_page'],
        photos: [for (var each in jsonDecoded['photos']) Photo.fromJson(each)]);
  }
}
