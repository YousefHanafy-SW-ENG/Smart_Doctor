import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign align;
  final Color textColor;
  final FontWeight fontWeigth;
  final double? fontSize;
  const AppText(
    this.text, {
    this.align = TextAlign.start,
    this.textColor = Colors.black,
    this.fontWeigth = FontWeight.w600,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 0.8.w, left: 0.8.w),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          color: textColor,

          fontWeight: fontWeigth,

          fontSize: fontSize ??
              (EasyLocalization.of(context)!.locale == const Locale('en')
                  ? 10.sp
                  : 12.sp),
          overflow: TextOverflow.ellipsis,
          // fontSize: 14,
        ),
        overflow: TextOverflow.visible,
      ),
    );
  }
}
/*
  final String text;
  final TextAlign align;
  final Color textColor;
  final FontWeight fontWeigth;
  final double? fontSize;
  final bool? showAsterisk;
  const AppText(
    this.text, {
    this.align = TextAlign.start,
    this.textColor = Colors.black,
    this.fontWeigth = FontWeight.w600,
    this.fontSize,
    this.showAsterisk,
    super.key,


   Visibility(
            visible: showAsterisk ?? false,
            child: Text(
              '*',
              style: TextStyle(
                color: AppColors.red,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          */