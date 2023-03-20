import 'package:flutter_pexels/features/popular_videos/models/user.dart';
import 'package:flutter_pexels/features/popular_videos/models/video_file.dart';

class Video {
  Video({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.image,
    required this.duration,
    required this.user,
    required this.videoFiles,
  });

  final int id;
  final int width;
  final int height;
  final String url;
  final String image;
  final int duration;
  final User user;
  final List<VideoFile> videoFiles;

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"],
      width: json["width"],
      height: json["height"],
      url: json["url"],
      image: json["image"],
      duration: json["duration"],
      user: User.fromJson(json["user"]),
      videoFiles: List<VideoFile>.from(
          json["video_files"].map((x) => VideoFile.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "image": image,
        "duration": duration,
        "user": user.toJson(),
        "video_files": List<dynamic>.from(videoFiles.map((x) => x.toJson())),
      };
}
