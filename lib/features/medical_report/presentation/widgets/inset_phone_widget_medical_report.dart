import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/login/presentation/cubit/login_cubit.dart';
import 'package:doctor_final/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class InsetPhoneWidgetMedicalReport extends StatelessWidget {
  final bool isMobileNumber;
  final TextEditingController controller;

  const InsetPhoneWidgetMedicalReport({
    Key? key,
    required this.controller,
    required this.isMobileNumber,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var myCubit = SignupCubit.getCubit(context);
    return Container(
      height: context.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.leftBoarderGrey,
            spreadRadius: 0.5,
            blurRadius: 1,
            inset: true,
            offset: const Offset(1, 1),
            blurStyle: BlurStyle.inner,
          ),
          BoxShadow(
            color: AppColors.rightBoarderGrey,
            spreadRadius: 0.5,
            blurRadius: 0,
            inset: true,
            offset: const Offset(-1, -1),
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: context.read<LoginCubit>().toggleText == 'العربية'
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    )
                  : const BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
            ),
            // child: CountryCodePicker(
            //   // barrierColor: Colors.green,
            //   dialogBackgroundColor: AppConstants.isCurrentThemeDark
            //       ? AppColors.darkGery
            //       : AppColors.white,
            //   initialSelection: myCubit.mobileNumberCountryCode,
            //   showCountryOnly: true,
            //   showFlag: false,
            //   textStyle: TextStyle(
            //     color: AppColors.white,
            //     fontSize: context.height * 0.017,
            //   ),
            //   onChanged: (value) {},
            // ),
          ),
          Container(
            color: AppConstants.isCurrentThemeDark
                ? AppColors.lightBlack
                : AppColors.white,
            width: context.width * 0.01,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppConstants.isCurrentThemeDark
                    ? AppColors.lightBlack
                    : AppColors.white,
              ),
              child: TextFormField(
                style: TextStyle(
                  color: AppConstants.isCurrentThemeDark
                      ? AppColors.white
                      : AppColors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: context.width * 0.04,
                  ),
                  border: InputBorder.none,
                ),
                controller: controller,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 10) {
                    return 'Enter at least 10 Numbers';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
