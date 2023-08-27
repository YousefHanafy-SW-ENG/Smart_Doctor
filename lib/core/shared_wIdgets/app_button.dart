import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../uitls/app_colors.dart';

enum ButtonType {
  save,
  search,
  report,
  delete,
  cancel,
  update,
  add,
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final ButtonType buttonType;
  const AppButton({
    required this.text,
    required this.onPress,
    required this.buttonType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.4.w),
      child: MaterialButton(
        onPressed: onPress,
        padding: EdgeInsets.zero,
        color: _selectBackGroundColor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: _selectBorderColor(),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 0),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize:
                  EasyLocalization.of(context)!.locale == const Locale('en')
                      ? 14.sp
                      : 15.sp,
            ),
          ),
        ),
      ),
    );
  }

  Color _selectBackGroundColor() {
    Color color;
    switch (buttonType) {
      case ButtonType.save:
        color = const Color(0xff6066a1);
        break;

      case ButtonType.search:
        color = const Color(0xff00acd3);
        break;

      case ButtonType.report:
        color = const Color(0xff2e6da4);
        break;

      case ButtonType.delete:
        color = const Color(0xffeb3422);
        break;
      case ButtonType.cancel:
        color = const Color(0xfffe9365);
        break;
      case ButtonType.add:
        color = const Color(0xff04AA6D);

        break;

      case ButtonType.update:
        color = const Color.fromRGBO(61, 100, 187, 1);
        break;
    }
    return color;
  }

  Color _selectBorderColor() {
    Color color;
    switch (buttonType) {
      case ButtonType.save:
        color = const Color(0xff5d66c3);

        break;

      case ButtonType.search:
        color = const Color(0xff08a0b4);
        break;

      case ButtonType.report:
        color = const Color(0xff065da9);
        break;

      case ButtonType.delete:
        color = const Color(0xffeb3422);
        break;
      case ButtonType.cancel:
        color = const Color(0xfffe9365);
        break;
      case ButtonType.add:
        color = const Color(0xff0ac282);

        break;
      case ButtonType.update:
        color = const Color.fromRGBO(61, 100, 187, 1);
        break;
    }
    return color;
  }
}
