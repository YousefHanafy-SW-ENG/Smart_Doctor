import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyElivatedContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback press;
  const EmptyElivatedContainer({
    Key? key,
    required this.child,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: SizedBox(
        height: 5.5.h,
        child: Material(
          shadowColor: AppColors.grey,
          color: AppConstants.isCurrentThemeDark
              ? AppColors.lightBlack
              : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 15.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
