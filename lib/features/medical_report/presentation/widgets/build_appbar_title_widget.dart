import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildAppBarTitleWidget extends StatelessWidget {
  final String image;
  final String text;

  const BuildAppBarTitleWidget({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 9.5.w,
        ),
        SizedBox(
          height: context.height * 0.03,
          width: context.width * 0.065,
          child: Image.asset(
            image,
          ),
        ),
        SizedBox(
          width: context.width * 0.015,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 17,
              ),
        ),
      ],
    );
  }
}
