import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text_with_asterisk.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildDoubleElement extends StatelessWidget {
  final String text;
  final Widget secoundWidget;
  final bool? hasAsterisk;
  const BuildDoubleElement({
    Key? key,
    required this.text,
    required this.secoundWidget,
    this.hasAsterisk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.height * 0.015),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: hasAsterisk == null || hasAsterisk == false
                ? AppText(text,
                    textColor: AppColors.primaryColor,
                    fontSize: EasyLocalization.of(context)!.locale ==
                            const Locale('en')
                        ? 10.sp
                        : 12.sp)
                : AppTextWithAsterisk(text,
                    textColor: AppColors.primaryColor,
                    fontSize: EasyLocalization.of(context)!.locale ==
                            const Locale('en')
                        ? 10.sp
                        : 12.sp),
          ),
          SizedBox(
            width: 1.5.w,
          ),
          Expanded(
            flex: 8,
            child: secoundWidget,
          ),
          SizedBox(
            width: 1.2.w,
          ),
        ],
      ),
    );
  }
}
