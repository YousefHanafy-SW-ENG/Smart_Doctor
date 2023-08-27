import 'package:doctor_final/core/shared_wIdgets/app_dialog.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text_with_asterisk.dart';
import 'package:doctor_final/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:doctor_final/features/signup/presentation/widgets/hijri_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/config/routes/app_routes.dart';
import 'package:doctor_final/core/shared_wIdgets/app_date_picker.dart';
import 'package:doctor_final/core/shared_wIdgets/app_drop_down_button.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/app_navigation_functions.dart';
import 'package:doctor_final/features/login/presentation/widgets/height_seperator.dart';
import 'package:doctor_final/features/signup/presentation/widgets/build_double_element.dart';
import 'package:doctor_final/features/signup/presentation/widgets/inset_phone_widget.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/shared_wIdgets/app_text_field.dart';
import '../../../../core/shared_wIdgets/app_toast.dart';

enum DateType {
  gregorian,
  hijri,
}

final personalDataFormKey = GlobalKey<FormState>();

class PersonalInfoStep extends StatelessWidget {
  const PersonalInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<SignupCubit>();
    myCubit.getGenderValues(context);

    myCubit.getIdTypeValues(context);
    myCubit.getReligionValues(context);

    return Form(
      key: personalDataFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppText(
            LocaleKeys.pleaseFillYourPersonalData.tr(),
            textColor: AppColors.red,
            fontWeigth: FontWeight.w400,
          ),
          //full name
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.firstName.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.firstNameController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid name';
                } else {
                  return null;
                }
              },
            ),
          ),
          BuildDoubleElement(
            text: LocaleKeys.secoundName.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.secoundNameController,
              validation: (value) {
                return null;
              },
            ),
          ),
          BuildDoubleElement(
            text: LocaleKeys.thirdName.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.thirdNameController,
              validation: (value) {
                return null;
              },
            ),
          ),
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.familyName.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.familyNameController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid name';
                }
                return null;
              },
            ),
          ),
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.gender.tr(),
            secoundWidget: BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                return AppDropDownButton(
                  changedValue: myCubit.gender,
                  listOfItems: myCubit.genderValues.keys.toList(),
                  onChange: (value) {
                    myCubit.gender = value.toString();
                    myCubit.getNationalityValues(context);
                    myCubit.getMaritalStatusValues(context);
                  },
                  hint:
                      '${LocaleKeys.selectYour.tr()} ${LocaleKeys.gender.tr()}',
                );
              },
            ),
          ),
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.nationality.tr(),
            secoundWidget: BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                if (state is LoadingNationalityValuesState) {
                  return const LinearProgressIndicator();
                } else {
                  return AppDropDownButton(
                    changedValue: myCubit.nationality,
                    listOfItems: myCubit.nationalValues.keys.toList(),
                    onChange: (value) {
                      myCubit.nationality = value.toString();
                      myCubit.showOrHidePassportNumber();
                    },
                    hint:
                        '${LocaleKeys.selectYour.tr()} ${LocaleKeys.nationality.tr()}',
                  );
                }
              },
            ),
          ),
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.idType.tr(),
            secoundWidget: BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                return AppDropDownButton(
                  changedValue: myCubit.idType,
                  listOfItems: myCubit.idTypeValues.keys.toList(),
                  onChange: (value) {
                    myCubit.idType = value.toString();
                    myCubit.showOrHidePassportNumber();
                  },
                  hint:
                      '${LocaleKeys.selectYour.tr()} ${LocaleKeys.idType.tr()}',
                );
              },
            ),
          ),
          BuildDoubleElement(
            text: LocaleKeys.idNumber.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.idNumberController,
              validation: (value) {
                if (myCubit.nationalValues[myCubit.nationality] == 55 &&
                    value!.length != 14) {
                  appToast(LocaleKeys.idNumberError.tr(), color: Colors.red);
                  return ' ';
                }
                if (value == null || value.isEmpty) {
                  return 'Please enter id Number';
                }
                return null;
              },
            ),
          ),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Visibility(
                visible: myCubit.isShowPassportNumber,
                child: BuildDoubleElement(
                  text: LocaleKeys.passportNumber.tr(),
                  secoundWidget: AppTextField(
                    controller: myCubit.passportNumberController,
                    validation: (value) {
                      if (myCubit.nationalValues[myCubit.nationality] == 55 &&
                          value!.length != 9) {
                        appToast(LocaleKeys.passportNumberShouldBe9Digits.tr(),
                            color: Colors.red);
                        return ' ';
                      }
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid passport number';
                      }
                      return null;
                    },
                  ),
                ),
              );
            },
          ),

          // //id number
          // BuildDoubleElement(
          //   text: LocaleKeys.idFrontImage.tr(),
          //   secoundWidget: EmptyElivatedContainer(
          //     child: Row(
          //       mainAxisAlignment:
          //           MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Expanded(
          //           child: AppText(
          //             LocaleKeys.clickOnTheCam.tr(),
          //             fontSize: 12.sp,
          //           ),
          //         ),
          //         Icon(
          //           Icons.upload_rounded,
          //           color: AppColors.red,
          //         ),
          //       ],
          //     ),
          //     press: () {
          //       myCubit.pickIdFrontImage();
          //     },
          //   ),
          // ),
          // if (myCubit.idFrontImage != null)
          //   Padding(
          //     padding: const EdgeInsets.only(top: 12.0),
          //     child: SizedBox(
          //       height: context.height * 0.13,
          //       // width: context.width * 0.5,
          //       child: Image(
          //         image: Image.file(
          //           myCubit.idFrontImage!,
          //           color: AppColors.white,
          //         ).image,
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),

          // BuildDoubleElement(
          //   text: LocaleKeys.idBackImage.tr(),
          //   secoundWidget: EmptyElivatedContainer(
          //     child: Row(
          //       mainAxisAlignment:
          //           MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Expanded(
          //           child: AppText(
          //             LocaleKeys.clickOnTheCam.tr(),
          //             fontSize: 12.sp,
          //           ),
          //         ),
          //         Icon(
          //           Icons.upload_rounded,
          //           color: AppColors.red,
          //         ),
          //       ],
          //     ),
          //     press: () {
          //       myCubit.pickIdBackImage();
          //     },
          //   ),
          // ),
          // if (myCubit.idBackImage != null)
          //   Padding(
          //     padding: const EdgeInsets.only(top: 12.0),
          //     child: SizedBox(
          //       height: context.height * 0.13,
          //       // width: context.width * 0.5,
          //       child: Image(
          //         image: Image.file(
          //           myCubit.idBackImage!,
          //           color: AppColors.white,
          //         ).image,
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),

          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.yourAdress.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.adressController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid adaress';
                }
                return null;
              },
            ),
          ),
          const HeightSeperator(),
          AppTextWithAsterisk(
            LocaleKeys.dateType.tr(),
            textColor: AppColors.primaryColor,
            fontSize: EasyLocalization.of(context)!.locale == const Locale('en')
                ? 10.sp
                : 12.sp,
          ),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<DateType>(
                          value: DateType.gregorian,
                          title: AppText(
                            LocaleKeys.gregorian.tr(),
                            fontSize: 8.sp,
                          ),
                          groupValue: myCubit.currentDateType,
                          onChanged: (newValue) =>
                              myCubit.changeCurrentDateType(newValue!),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<DateType>(
                          value: DateType.hijri,
                          title: AppText(
                            LocaleKeys.hijri.tr(),
                            fontSize: 8.sp,
                          ),
                          groupValue: myCubit.currentDateType,
                          onChanged: (newValue) =>
                              myCubit.changeCurrentDateType(newValue!),
                        ),
                      ),
                    ],
                  ),
                  BuildDoubleElement(
                    hasAsterisk: true,
                    text: LocaleKeys.dateOfBirth.tr(),
                    secoundWidget: myCubit.currentDateType == DateType.hijri
                        ? AppText("Hijry date ")
                        : AppDatePicker(
                            initialDate: myCubit.birthOfDate,
                            onChange: (value) {
                              myCubit.birthOfDate = value.toString();
                            },
                          ),
                  ),
                ],
              );
            },
          ),
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.religion.tr(),
            secoundWidget: BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                return AppDropDownButton(
                  changedValue: myCubit.religion,
                  listOfItems: myCubit.religionValues.keys.toList(),
                  onChange: (value) {
                    myCubit.religion = value.toString();
                  },
                  hint:
                      '${LocaleKeys.selectYour.tr()} ${LocaleKeys.religion.tr()}',
                );
              },
            ),
          ),
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.job.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.jobController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter job';
                }
                return null;
              },
            ),
          ),

          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.maritalStatus.tr(),
            secoundWidget: BlocBuilder<SignupCubit, SignupState>(
              builder: (context, state) {
                if (state is LoadingMaritalValuesState) {
                  return const LinearProgressIndicator();
                } else {
                  return AppDropDownButton(
                    changedValue: myCubit.maritalStatus,
                    listOfItems: myCubit.maritalStatusValues.keys.toList(),
                    onChange: (value) {
                      myCubit.maritalStatus = value.toString();
                    },
                    hint:
                        '${LocaleKeys.selectYour.tr()} ${LocaleKeys.maritalStatus.tr()}',
                  );
                }
              },
            ),
          ),

          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.mobileNumber.tr(),
            secoundWidget: InsetPhoneWidget(
              controller: myCubit.mobiledNumberController,
            ),
          ),

          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.email.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.emailController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
            ),
          ),
          //password
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.password.tr(),
            secoundWidget: AppTextField(
              alwaysEnableEditing: true,
              controller: myCubit.passwordController,
              keyBoardType: TextInputType.emailAddress,
              isPassword: true,
              validation: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !checkPasswordValidation(value)) {
                  appToast(
                    LocaleKeys.passwordShouldHaveUpperandlowerchar.tr(),
                    color: Colors.red,
                  );
                  return LocaleKeys.enterValidPassword.tr();
                }
                return null;
              },
            ),
          ),
          //confirm password (1)
          BuildDoubleElement(
            hasAsterisk: true,
            text: LocaleKeys.confirmPassword.tr(),
            secoundWidget: AppTextField(
              controller: myCubit.confirmPasswordController,
              keyBoardType: TextInputType.emailAddress,
              isPassword: true,
              validation: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value != myCubit.passwordController.text) {
                  return LocaleKeys.passwordsIsNotMatch.tr();
                }
                // appToast(LocaleKeys.thePasswrodsIsNotMatch.tr());
                return null;
              },
            ),
          ),

          const HeightSeperator(),
          // MyButton(
          //     color: AppColors.primaryColor,
          //     text: LocaleKeys.create.tr(),
          //     press: () {
          //       if (signupFormKey.currentState!
          //           .validate()) {
          //         AppNavigation.pushAndDelete(
          //             route: Routes.homeScreen,
          //             context: context);
          //       }
          //     }),
          Align(
            alignment: AlignmentDirectional.center,
            child: TextButton(
              onPressed: () {
                if (personalDataFormKey.currentState!.validate()) {
                  myCubit.changeCurrentStepIndex(myCubit.currentStepIndex + 1);
                }

                // myCubit.changeCurrentStepIndex(myCubit.currentStepIndex + 1);
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
          ),

          //have an account ? login
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.haveAnAccount.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              InkWell(
                onTap: () {
                  AppNavigation.pushAndDelete(
                      route: Routes.loginScreen, context: context);
                  myCubit.clearAllSignUpControllers();
                },
                child: Text(
                  LocaleKeys.login.tr(),
                  style:
                      TextStyle(fontSize: 12.sp, color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

bool _hasUpperCase(String string) {
  return RegExp(r'[A-Z]').hasMatch(string);
}

bool _hasLowerCase(String string) {
  return RegExp(r'[a-z]').hasMatch(string);
}

bool _containsSpecialCharacter(String string) {
  final specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  return specialChars.hasMatch(string);
}

bool checkPasswordValidation(String string) {
  return string.length > 10 &&
      _hasUpperCase(string) &&
      _hasLowerCase(string) &&
      _containsSpecialCharacter(string);
}
