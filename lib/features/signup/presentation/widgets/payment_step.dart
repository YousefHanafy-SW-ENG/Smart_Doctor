import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/shared_wIdgets/app_button.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text_field.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/features/login/presentation/widgets/height_seperator.dart';
import 'package:doctor_final/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:doctor_final/features/signup/presentation/widgets/build_double_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../translation/Local_Key.g.dart';

class PaymentStep extends StatelessWidget {
  const PaymentStep({super.key});

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<SignupCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          LocaleKeys.pleaseFillYourMethodOfPayment.tr(),
          textColor: AppColors.red,
          fontWeigth: FontWeight.w500,
        ),
        HeightSeperator(height: 1.5.h),
        Container(
          color: AppColors.blue,
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
          ),
          child: Center(
            child: AppText(LocaleKeys.visa.tr(), textColor: AppColors.white),
          ),
        ),
        BuildDoubleElement(
          hasAsterisk: true,
          text: LocaleKeys.cardNumber.tr(),
          secoundWidget: AppTextField(
            controller: myCubit.cardNumberController,
            validation: (value) {
              return null;
            },
          ),
        ),
        BuildDoubleElement(
          hasAsterisk: true,
          text: LocaleKeys.expireDate.tr(),
          secoundWidget: AppTextField(
            controller: myCubit.expireDateController,
            validation: (value) {
              return null;
            },
          ),
        ),
        BuildDoubleElement(
          hasAsterisk: true,
          text: LocaleKeys.cvv.tr(),
          secoundWidget: AppTextField(
            controller: myCubit.cvvController,
            validation: (value) {
              return null;
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () =>
                  myCubit.changeCurrentStepIndex(myCubit.currentStepIndex - 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.skip_previous,
                    color: AppColors.lightBlue,
                  ),
                  AppText(
                    LocaleKeys.back.tr(),
                    textColor: AppColors.lightBlue,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
          child: SizedBox(
            width: double.infinity,
            height: 6.h,
            child: AppButton(
              text: LocaleKeys.saveAndRegister.tr(),
              buttonType: ButtonType.add,
              onPress: () {},
            ),
          ),
        ),
      ],
    );
  }
}
