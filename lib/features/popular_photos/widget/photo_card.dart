import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pexels/features/popular_photos/models/photo.dart';
import 'package:flutter_pexels/features/popular_photos/providers/background_color_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class PhotoCard extends ConsumerWidget {
  final Photo photo;
  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avgColor = int.parse(photo.avgColor.replaceAll('#', '0xFF'));
    ref.read(backgroundColorProvider.notifier).updateColor(Color(avgColor));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            photo.alt,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: photo.source.original ?? "",
            progressIndicatorBuilder: (context, url, progress) => Image.network(
              photo.source.medium ?? "",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(photo.url))) {
                    launchUrl(Uri.parse(photo.url));
                  }
                },
                child: Text(
                  'Photo by ${photo.photographer} on Pexels',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(decoration: TextDecoration.underline),
                )),
          ),
        ),
        const Divider()
      ],
    );
  }
}
