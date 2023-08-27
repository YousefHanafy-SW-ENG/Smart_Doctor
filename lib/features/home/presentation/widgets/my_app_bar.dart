import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/app_navigation_functions.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/features/login/presentation/cubit/login_cubit.dart';
import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_overlay_widget.dart';
import 'package:doctor_final/features/visitScreen/presentation/widgets/show_type_overlay_visits_screen.dart';
import 'package:flutter/material.dart';

AppBar myAppBar({
  required Widget appTitle,
  required bool centerTitle,
  required bool hasBackArrow,
  required VoidCallback backButton_onClick,
  required context,
  double leadingWidth = 0,
  PreferredSizeWidget? bottom,
}) {
  // final myCubit = context.read<LoginCubit>();
  return AppBar(
    leading: hasBackArrow
        ? IconButton(
            icon: LoginCubit().getCubit(context).toggleText == 'العربية'
                ? Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppConstants.isCurrentThemeDark
                        ? AppColors.white
                        : AppColors.darkBlack,
                  )
                : Icon(
                    Icons.arrow_back_ios,
                    color: AppConstants.isCurrentThemeDark
                        ? AppColors.white
                        : AppColors.darkBlack,
                  ),
            onPressed: backButton_onClick,
          )
        : null,
    title: appTitle,
    centerTitle: centerTitle,
    leadingWidth: leadingWidth,
    actions: [
      Padding(
        padding: LoginCubit().getCubit(context).toggleText == 'العربية'
            ? const EdgeInsets.only(right: 10.0)
            : const EdgeInsets.only(left: 10.0),
        child: Image.asset(
          ImageManager.hospital,
        ),
      ),
    ],
    bottom: bottom,
  );
}
