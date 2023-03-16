import 'package:flutter_pexels/features/popular_photos/models/photo_source.dart';

class Photo {
  final int id, width, height, photographerId;
  final String photographer, alt, avgColor;
  final PhotoSource source;
  Photo(
      {required this.id,
      required this.width,
      required this.height,
      required this.avgColor,
      required this.alt,
      required this.photographerId,
      required this.source,
      required this.photographer});

  static Photo fromMap(Map<String, dynamic> jsonDecoded) {
    late Photo photo;
    try {
      final src = PhotoSource.fromMap(jsonDecoded['src']);
      photo = Photo(
          alt: jsonDecoded['alt'],
          height: jsonDecoded['height'],
          width: jsonDecoded['width'],
          id: jsonDecoded['id'],
          photographer: jsonDecoded['photographer'],
          photographerId: jsonDecoded['photographer_id'],
          avgColor: jsonDecoded['avg_color'],
          source: src);
    } catch (_) {}
    return photo;
  }
}
