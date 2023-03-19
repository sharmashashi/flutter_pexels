import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FakeSearchBar extends StatelessWidget {
  final String hintText;
  const FakeSearchBar({super.key, this.hintText = "Himalayas"});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder();
    return TextField(
      onSubmitted: (value) async {},
      decoration: InputDecoration(
          enabled: false,
          prefixIcon: const Icon(Icons.search),
          hintText: hintText,
          border: border,
          isDense: true,
          focusedBorder: border,
          disabledBorder: border,
          enabledBorder: border),
    );
  }
}
