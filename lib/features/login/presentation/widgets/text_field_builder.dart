import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/login/presentation/cubit/login_cubit.dart';
import 'package:doctor_final/features/login/presentation/widgets/text_field_container.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/uitls/app_colors.dart';

class TextFieldBuilder extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isPassword;
  final bool containSuffix;
  final bool hasBorder;
  final VoidCallback? eyePress;
  final IconData suffixIcon;
  final TextEditingController controller;

  const TextFieldBuilder({
    Key? key,
    required this.text,
    required this.icon,
    required this.containSuffix,
    required this.controller,
    this.isPassword = false,
    this.hasBorder = false,
    this.eyePress,
    this.suffixIcon = Icons.visibility_off,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<LoginCubit>();

    final isSmallDisplay = MediaQuery.of(context).size.width < 600;
    return SizedBox(
      height: context.height * 0.07,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextFieldContainer(
              color: AppConstants.isCurrentThemeDark == false
                  ? AppColors.white
                  : AppColors.lightBlack,
              child: Padding(
                padding: myCubit.toggleText == 'العربية'
                    ? EdgeInsets.only(left: context.width * 0.17)
                    : EdgeInsets.only(right: context.width * 0.18),
                child: TextFormField(
                  obscureText: isPassword,
                  style: TextStyle(
                    color: AppConstants.isCurrentThemeDark
                        ? AppColors.white
                        : AppColors.black,
                  ),
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: context.height * 0.013,
                      height: 0,
                      fontWeight: FontWeight.w300,
                    ),
                    contentPadding: myCubit.toggleText == 'العربية'
                        ? EdgeInsets.only(
                            top: context.height * 0.01,
                            bottom: context.height * 0.01,
                          )
                        : EdgeInsets.only(
                            top: context.height * 0.02,
                          ),
                    hintText: text,
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.displayLarge,
                    suffixIcon: containSuffix
                        ? IconButton(
                            icon: Icon(
                              size: 2.5.h,
                              suffixIcon,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: eyePress,
                          )
                        : null,
                  ),
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return LocaleKeys.enterValidData.tr();
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Material(
            color: AppConstants.isCurrentThemeDark == false
                ? AppColors.white
                : AppColors.lightBlack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: isSmallDisplay ? 2.h : 1.3.h,
                  horizontal: isSmallDisplay ? 2.2.h : 2.5.w),
              child: Icon(
                icon,
                // size: 4.8.h,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
