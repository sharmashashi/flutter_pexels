import 'package:flutter_dotenv/flutter_dotenv.dart';

class Configs {
  // static const apiKey = String.fromEnvironment("pexels_api_key");
  static String apiKey = dotenv.get('pexels_api_key');
  static String baseUrl = 'https://api.pexels.com';
}
