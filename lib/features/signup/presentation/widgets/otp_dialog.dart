import 'package:easy_localization/easy_localization.dart';
import 'package:email_otp/email_otp.dart';
import 'package:doctor_final/core/shared_wIdgets/app_button.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text_field.dart';
import 'package:doctor_final/core/shared_wIdgets/app_toast.dart';
import 'package:doctor_final/features/login/presentation/widgets/height_seperator.dart';
import 'package:doctor_final/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class OtpDialog extends StatelessWidget {
  const OtpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            LocaleKeys.verificationCode.tr(),
            fontSize: 20.sp,
            textColor: Colors.grey,
          ),
          const HeightSeperator(),
          AppText(LocaleKeys.weSendCodeForThisEmail.tr()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
            child: AppTextField(controller: otpController),
          ),
          Center(
            child: AppButton(
              text: LocaleKeys.confirm.tr(),
              buttonType: ButtonType.add,
              onPress: () {
                if (otpController.text.isNotEmpty) {
                  context
                      .read<SignupCubit>()
                      .validateOtp(otpController.text)
                      .then((value) {
                    if (value == true) {
                      print(true);
                      Navigator.pop(context);
                    } else {
                      appToast(LocaleKeys.otpIsNotValidPleaseTryAgain.tr());
                    }
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
