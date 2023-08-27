import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';

class BuildDoubleVirticallyWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const BuildDoubleVirticallyWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.white,
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
        SizedBox(
          width: context.width * 0.08,
          child: Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.white, fontSize: 9),
          ),
        ),
      ],
    );
  }
}
