import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';

class HeightSeperator extends StatelessWidget {
  final double? height;
  const HeightSeperator({
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.height * 0.03,
    );
  }
}
