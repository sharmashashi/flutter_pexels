class PhotoSource {
  final String? original,
      large2x,
      large,
      medium,
      small,
      portrait,
      landscape,
      tiny;

  PhotoSource(
      {this.original,
      this.large,
      this.large2x,
      this.medium,
      this.portrait,
      this.landscape,
      this.small,
      this.tiny});

  static PhotoSource fromMap(Map<String, dynamic> jsonDecoded) {
    PhotoSource? src;
    src = PhotoSource(
        large2x: jsonDecoded['large2x'],
        large: jsonDecoded['large'],
        medium: jsonDecoded['medium'],
        original: jsonDecoded['original'],
        portrait: jsonDecoded['portrait'],
        landscape: jsonDecoded['landscape'],
        small: jsonDecoded['small'],
        tiny: jsonDecoded['tiny']);
    return src;
  }
}
