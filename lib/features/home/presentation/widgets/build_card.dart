import 'package:doctor_final/core/shared_wIdgets/app_text.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildCard extends StatelessWidget {
  final String icon;
  final String text;
  final int number;
  final bool showNotificationCircule;
  final double? textSize;

  const BuildCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.showNotificationCircule,
    this.number = 6,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.height * 0.09,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: context.width * 0.022,
              ),
              SizedBox(
                // height: context.height * 0.09,
                // width: context.height * 0.08,
                height: 7.h,
                width: AppConstants.weRunOnWeb ? 8.w : 13.w,
                child: Image.asset(
                  icon,
                ),
              ),
              SizedBox(
                width: context.width * 0.02,
              ),
              Expanded(
                child: AppText(
                  text,
                  fontWeigth: FontWeight.bold,
                  fontSize: textSize ?? 17.sp,
                  textColor: AppColors.white,
                ),
              ),
              // const Spacer(),
              if (showNotificationCircule)
                CircleAvatar(
                  backgroundColor: AppColors.red,
                  child: Text(
                    number.toString(),
                    style: const TextStyle(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              SizedBox(
                width: context.width * 0.024,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
