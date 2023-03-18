import 'package:flutter_pexels/features/popular_videos/models/video.dart';

class PopularVideosResponse {
  PopularVideosResponse({
    required this.page,
    required this.perPage,
    required this.totalResults,
    required this.url,
    required this.videos,
  });

  final int page;
  final int perPage;
  final int totalResults;
  final String url;
  final List<Video> videos;

  factory PopularVideosResponse.fromJson(Map<String, dynamic> json) =>
      PopularVideosResponse(
        page: json["page"],
        perPage: json["per_page"],
        totalResults: json["total_results"],
        url: json["url"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total_results": totalResults,
        "url": url,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}
