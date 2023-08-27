import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

// ignore: must_be_immutable
class InsetTextFieldContainer extends StatelessWidget {
  Widget? child;
  Color? color;
  InsetTextFieldContainer({
    Key? key,
    this.child,
    this.color = const Color.fromRGBO(255, 255, 255, 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.08,
      decoration: BoxDecoration(
        color: AppConstants.isCurrentThemeDark
            ? AppColors.lightBlack
            : AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppConstants.isCurrentThemeDark
                ? AppColors.darkBlack
                : AppColors.leftBoarderGrey,
            spreadRadius: 0.5,
            blurRadius: 1,
            inset: true,
            offset: const Offset(1, 1),
            blurStyle: BlurStyle.inner,
          ),
          BoxShadow(
            color: AppConstants.isCurrentThemeDark
                ? AppColors.darkBlack
                : AppColors.rightBoarderGrey,
            spreadRadius: 0.5,
            blurRadius: 0,
            inset: true,
            offset: const Offset(-1, -1),
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),

      // child: Padding(
      //   padding: const EdgeInsets.only(
      //     top: 8.0,
      //     left: 15.0,
      //     bottom: 8.0,
      //     right: 8.0,
      //   ),
      //   child: child,
      // ),
      child: child,
    );
  }
}
