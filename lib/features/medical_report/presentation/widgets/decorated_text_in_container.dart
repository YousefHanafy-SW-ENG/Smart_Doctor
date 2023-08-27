import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/shared_wIdgets/app_text.dart';

class DecoratedTextInContainer extends StatelessWidget {
  final String text;
  const DecoratedTextInContainer(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: AppText(
                text,
              ),
            )),
      ),
    );
  }
}
