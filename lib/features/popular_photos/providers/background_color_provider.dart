import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final backgroundColorProvider =
    NotifierProvider<BackgroundColorNotifier, Color>(
  () {
    return BackgroundColorNotifier();
  },
);

class BackgroundColorNotifier extends Notifier<Color> {
  @override
  build() {
    return Colors.grey.shade300;
  }

  @override
  bool updateShouldNotify(previous, next) {
    return previous != next;
  }

 void updateColor(Color color) async {
    await Future.delayed(const Duration(seconds: 0));
    state = color.lighten(20);
  }
}
