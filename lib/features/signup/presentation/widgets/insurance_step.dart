import 'package:doctor_final/core/shared_wIdgets/app_drop_down_search.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text_field.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
// import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/shared_wIdgets/app_drop_down_button.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/features/login/presentation/widgets/height_seperator.dart';
import 'package:doctor_final/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:doctor_final/features/signup/presentation/widgets/build_double_element.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/shared_wIdgets/app_button.dart';

final insuranceDataFormKey = GlobalKey<FormState>();

class InsuranceStep extends StatelessWidget {
  const InsuranceStep({super.key});

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<SignupCubit>();
    return Form(
      key: insuranceDataFormKey,
      child: Padding(
        padding: EdgeInsets.only(
          // top: context.height * 0.07,
          // left: context.height * 0.015,
          // right: context.height * 0.01,
          bottom: context.height * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              LocaleKeys.pleaseFillYourInsuranceData.tr(),
              textColor: AppColors.red,
              fontWeigth: FontWeight.w400,
            ),
            BuildDoubleElement(
              hasAsterisk: true,
              text: LocaleKeys.insuranceName.tr(),
              secoundWidget: AppDropDownSearch(
                selectedValue: myCubit.insuranceName,
                asyncItems: (searchKey) {
                  return myCubit.getInsuranceNameValues(context, searchKey);
                },
                // listOfItems: myCubit.insuranceNameValues.keys.toList(),

                onChange: (value) {
                  myCubit.insuranceName = value.toString();
                  myCubit.getInsuranceCompanyValues(
                      myCubit.insuranceNameValues[myCubit.insuranceName]!);
                },
              ),
            ),
            BuildDoubleElement(
              hasAsterisk: true,
              text: LocaleKeys.insuranceCompany.tr(),
              secoundWidget: BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  if (state is LoadingInsuranceValuesState) {
                    return const LinearProgressIndicator();
                  } else {
                    return AppDropDownButton(
                      changedValue: myCubit.insuranceCompany,
                      listOfItems: myCubit.insuranceCompanyValues.keys.toList(),
                      onChange: (value) {
                        myCubit.insuranceCompany = value.toString();
                      },
                    );
                  }
                },
              ),
            ),
            // BuildDoubleElement(
            //   text: LocaleKeys.insuranceType.tr(),
            //   secoundWidget: AppDropDownButton(
            //     changedValue: myCubit.insuranceType,
            //     listOfItems: myCubit.insuranceTypeValues.keys.toList(),
            //     onChange: (value) {
            //       myCubit.insuranceType = value.toString();
            //     },
            //   ),
            // ),
            BuildDoubleElement(
              hasAsterisk: true,
              text: LocaleKeys.insuranceId.tr(),
              secoundWidget: AppTextField(
                controller: myCubit.insuranceIdController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enterValidInsuranceId.tr();
                  }
                  return null;
                },
              ),
            ),
            BuildDoubleElement(
              hasAsterisk: true,
              text: LocaleKeys.insuranceLevel.tr(),
              secoundWidget: AppDropDownSearch(
                // listOfItems: myCubit.insuranceLevelValues.keys.toList(),
                selectedValue: myCubit.insuranceLevel,
                asyncItems: (searchKey) {
                  return myCubit.getInsuranceLevelValues(searchKey);
                },
                onChange: (value) {
                  myCubit.insuranceLevel = value.toString();
                },
              ),
            ),
            const HeightSeperator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => myCubit
                      .changeCurrentStepIndex(myCubit.currentStepIndex - 1),
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
                TextButton(
                  onPressed: () {
                    // if (insuranceDataFormKey.currentState!.validate()) {
                    //   if (myCubit.insuranceName == '' ||
                    //       myCubit.insuranceCompany == '' ||
                    //       myCubit.insuranceType == '' ||
                    //       myCubit.insuranceLevel == '') {
                    //     appToast(
                    //       LocaleKeys.allFieldsAreRequired.tr(),
                    //       color: Colors.red,
                    //     );
                    //     return;
                    //   }
                    //   myCubit.sendPersonalDataToApi();
                    //   myCubit
                    //       .changeCurrentStepIndex(myCubit.currentStepIndex + 1);
                    // }
                    myCubit
                        .changeCurrentStepIndex(myCubit.currentStepIndex + 1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        LocaleKeys.next.tr(),
                        textColor: AppColors.red,
                      ),
                      Icon(
                        Icons.arrow_circle_right,
                        color: AppColors.red,
                      )
                    ],
                  ),
                ),

                // TextButton(
                //   onPressed: () =>
                //       myCubit.changeCurrentStepIndex(
                //           myCubit.currentStepIndex + 1),
                //   child: Row(
                //     mainAxisAlignment:
                //         MainAxisAlignment.end,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       AppText(
                //         LocaleKeys.skip.tr(),
                //         textColor: AppColors.lightBlue,
                //       ),
                //       Icon(
                //         Icons.skip_next_sharp,
                //         color: AppColors.lightBlue,
                //       ),
                //     ],
                //   ),
                // ),
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
                  onPress: () {
                    myCubit.sendPersonalDataToApi(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
