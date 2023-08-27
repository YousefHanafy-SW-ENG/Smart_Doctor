import 'package:flutter/material.dart';

class ScreenArguments {
  final String title;
  final String image;

  ScreenArguments({
    required this.title,
    required this.image,
  });
}

class ImageArgument {
  final Image image;

  ImageArgument({required this.image});
}
