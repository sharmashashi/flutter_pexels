import 'dart:async';
import 'dart:developer';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_pexels/screens/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runZonedGuarded(() async {
    await dotenv.load(fileName: '.env');
    runApp(ProviderScope(
      child: MaterialApp(
        themeMode: ThemeMode.light,
        home: const Home(),
        theme:
            FlexThemeData.light(useMaterial3: true, scheme: FlexScheme.green),
        darkTheme:
            FlexThemeData.dark(useMaterial3: true, scheme: FlexScheme.green),
      ),
    ));
  }, (error, stack) {
    log(error.toString(), stackTrace: stack);
  });
}
