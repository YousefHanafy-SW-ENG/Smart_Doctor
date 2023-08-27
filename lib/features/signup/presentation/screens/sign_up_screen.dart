import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/login/presentation/widgets/height_seperator.dart';
import 'package:doctor_final/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:doctor_final/features/signup/presentation/widgets/medical_info_step.dart';
import 'package:doctor_final/features/signup/presentation/widgets/payment_step.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../widgets/insurance_step.dart';
import '../widgets/personal_info_step.dart';

class SignUpScreen extends StatelessWidget {
  final paymentDataFormKey = GlobalKey<FormState>();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<SignupCubit>();
    //TODO 2SM KOL FUNCTION M3A EL STEP BTA3THA W 2SMHOM 3LA 3 BUILDER
    //TODO A3ML CONDITIONAL BUILDER W AL3B 3LA EL STATES 34AN EL PERFORMANCE
    //TODO 5ly el combo boxes custom widget mwgoda f builder 34an t3dl tb3 el state w 5ly ba2y el widgets stateless

    // myCubit.getInsuranceNameValues(context);
    // myCubit.getInsuranceCompanyValues(1);
    // myCubit.getInsuranceTypeValues(context);
    // myCubit.getInsuranceLevelValues();
    // myCubit.getHeigtValues(context);
    // myCubit.getWeightValues(context);
    // myCubit.getBloodTypeValues();
    // myCubit.getDiseasesValues(context);
    // myCubit.getAllerigiesValues(context);
    // myCubit.getOperationValues();
    // myCubit.getMedicationValues();
    // myCubit.getRadiologyTypeValues(context);
    // myCubit.getRadiologyAreaValues(context);
    // myCubit.getToClinicValues(context);
    // myCubit.getSmokingValues(context);
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Theme(
              data: ThemeData(
                shadowColor: Colors.transparent,
                colorScheme: ColorScheme.light(primary: AppColors.lightBlue),
              ),
              child: Column(
                children: [
                  AppText(LocaleKeys.createAnAcc.tr()),
                  HeightSeperator(height: 2.h),
                  Expanded(
                    child: Stepper(
                      onStepTapped: (index) {
                        myCubit.changeCurrentStepIndex(index);
                      },
                      // elevation: 10,
                      physics: const BouncingScrollPhysics(),
                      type: StepperType.horizontal,
                      currentStep: myCubit.currentStepIndex,
                      // currentStep: 1,
                      controlsBuilder: (context, details) => const SizedBox(),
                      steps: [
                        //! step 1
                        Step(
                          isActive: myCubit.currentStepIndex == 0,
                          label: Text(
                            LocaleKeys.personalInfo.tr(),
                            style: TextStyle(
                              color: myCubit.currentStepIndex == 0
                                  ? AppColors.lightBlue
                                  : AppColors.primaryColor,
                              fontSize: 10.sp,
                            ),
                          ),
                          title: const SizedBox(),
                          // title: const SizedBox(),
                          content: const PersonalInfoStep(),
                        ),

                        //? step 2
                        Step(
                          isActive: myCubit.currentStepIndex == 1,
                          label: Text(
                            LocaleKeys.insurance.tr(),
                            style: TextStyle(
                              color: myCubit.currentStepIndex == 1
                                  ? AppColors.lightBlue
                                  : AppColors.primaryColor,
                              fontSize: 10.sp,
                            ),
                          ),
                          title: const SizedBox(),
                          content: const InsuranceStep(),
                        ),
                        //* step 3
                        Step(
                            isActive: myCubit.currentStepIndex == 2,
                            label: Text(
                              LocaleKeys.medicalInfo.tr(),
                              style: TextStyle(
                                color: myCubit.currentStepIndex == 2
                                    ? AppColors.lightBlue
                                    : AppColors.primaryColor,
                                fontSize: 10.sp,
                              ),
                            ),
                            title: const SizedBox(),
                            content: const MedicalInfoStep()),
                        //! step 4
                        Step(
                          isActive: myCubit.currentStepIndex == 3,
                          label: Text(
                            LocaleKeys.payment.tr(),
                            style: TextStyle(
                              color: myCubit.currentStepIndex == 3
                                  ? AppColors.lightBlue
                                  : AppColors.primaryColor,
                              fontSize: 10.sp,
                            ),
                          ),
                          title: const SizedBox(),
                          content: Form(
                            key: paymentDataFormKey,
                            child: Padding(
                              padding: EdgeInsets.only(
                                // top: context.height * 0.07,
                                // left: context.height * 0.015,
                                // right: context.height * 0.01,
                                bottom: context.height * 0.03,
                              ),
                              child: const PaymentStep(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
