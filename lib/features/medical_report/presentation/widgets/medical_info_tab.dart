import 'package:doctor_final/core/shared_wIdgets/app_text_field.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/signup/presentation/cubit/signup_cubit.dart';
// import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/shared_wIdgets/app_drop_down_button.dart';
import 'package:doctor_final/core/shared_wIdgets/app_text.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/features/login/presentation/widgets/height_seperator.dart';
import 'package:doctor_final/features/signup/presentation/widgets/build_double_element.dart';
import 'package:doctor_final/features/signup/presentation/widgets/empty_elivated_container.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/shared_wIdgets/app_button.dart';
import '../../../../core/uitls/constants.dart';

//! Very Important
//TODO change the cubit and the controllers create new controllers to in medical report cubit to show it
//! Very Important
class MedicalInfoTab extends StatelessWidget {
  const MedicalInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    final myCubit = context.read<SignupCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.w),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          _SeperatorContainer(
            LocaleKeys.bodyMeasurement.tr(),
          ),

          //full name
          BuildDoubleElement(
            text: LocaleKeys.yourHeight.tr(),
            secoundWidget: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: myCubit.yourHeightController,
                    keyBoardType: TextInputType.number,
                    onEditComplete: (_) => myCubit.calculateBMI(),
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid height';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: AppDropDownButton(
                    changedValue: myCubit.heightUnit,
                    listOfItems: myCubit.heightUnitValues.keys.toList(),
                    onChange: (value) {
                      myCubit.heightUnit = value.toString();
                    },
                  ),
                ),
              ],
            ),
          ),

          BuildDoubleElement(
            text: LocaleKeys.yourWeight.tr(),
            secoundWidget: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: myCubit.yourWeightController,
                    onEditComplete: (_) => myCubit.calculateBMI(),
                    keyBoardType: TextInputType.number,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid weight';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: AppDropDownButton(
                    changedValue: myCubit.weightUnit,
                    listOfItems: myCubit.weightUnitValues.keys.toList(),
                    onChange: (value) {
                      myCubit.weightUnit = value.toString();
                    },
                  ),
                ),
              ],
            ),
          ),

          BuildDoubleElement(
            text: LocaleKeys.bMI.tr(),
            secoundWidget: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    alwaysEnableEditing: false,
                    controller: myCubit.bMIController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid weight';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: AppDropDownButton(
                    changedValue: myCubit.bMi,
                    listOfItems: myCubit.bMIValues.keys.toList(),
                    onChange: (value) {
                      myCubit.bMi = value.toString();
                    },
                  ),
                ),
              ],
            ),
          ),
          const HeightSeperator(height: 7),
          _SeperatorContainer(
            LocaleKeys.medicalData.tr(),
          ),

          BuildDoubleElement(
            text: LocaleKeys.bloodType.tr(),
            secoundWidget: AppDropDownButton(
              changedValue: myCubit.bloodType,
              listOfItems: myCubit.bloodTypeValues.keys.toList(),
              onChange: (value) {
                myCubit.bloodType = value.toString();
              },
            ),
          ),

          BuildDoubleElement(
            text: LocaleKeys.smoking.tr(),
            secoundWidget: AppDropDownButton(
              changedValue: myCubit.smoking,
              listOfItems: myCubit.smokingValues.keys.toList(),
              onChange: (value) {
                myCubit.smoking = value.toString();
              },
            ),
          ),
          const HeightSeperator(height: 7),
          _SeperatorContainer(
            LocaleKeys.medicalHistory.tr(),
          ),

          BuildDoubleElement(
            text: LocaleKeys.pleaseAddDiseasesIfYouHaveAny.tr(),
            secoundWidget: AppDropDownButton(
              changedValue: myCubit.diseases,
              listOfItems: myCubit.diseasesValues.keys.toList(),
              onChange: (value) {
                myCubit.diseases = value.toString();
              },
            ),
          ),

          BuildDoubleElement(
            text: LocaleKeys.pleaseAddAllergiesIfYouHaveAny.tr(),
            secoundWidget: AppDropDownButton(
              changedValue: myCubit.allergies,
              listOfItems: myCubit.allergiesValues.keys.toList(),
              onChange: (value) {
                myCubit.allergies = value.toString();
              },
            ),
          ),

          BuildDoubleElement(
            text: LocaleKeys.pleaseAddOperationIfYouDidAny.tr(),
            secoundWidget: AppDropDownButton(
              changedValue: myCubit.operations,
              listOfItems: myCubit.operationsValues.keys.toList(),
              onChange: (value) {
                myCubit.operations = value.toString();
              },
            ),
          ),

          BuildDoubleElement(
            text: LocaleKeys.pleaseAddMedicationIfYoutakeAny.tr(),
            secoundWidget: AppDropDownButton(
              changedValue: myCubit.medication,
              listOfItems: myCubit.medicationValues.keys.toList(),
              onChange: (value) {
                myCubit.medication = value.toString();
              },
            ),
          ),
          HeightSeperator(
            height: 3.h,
          ),

          // ! radiology
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.babyBlue,
              boxShadow: [
                BoxShadow(
                  color: AppConstants.isCurrentThemeDark
                      ? AppColors.darkBlack
                      : AppColors.leftBoarderGrey,
                  spreadRadius: 0.5,
                  blurRadius: 1,
                  inset: true,
                  offset: const Offset(1, 1),
                  blurStyle: BlurStyle.inner,
                ),
                BoxShadow(
                  color: AppConstants.isCurrentThemeDark
                      ? AppColors.darkBlack
                      : AppColors.rightBoarderGrey,
                  spreadRadius: 0.5,
                  blurRadius: 0,
                  inset: true,
                  offset: const Offset(-1, -1),
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  LocaleKeys.radiology.tr(),
                  align: TextAlign.start,
                  fontSize: 15.sp,
                  fontWeigth: FontWeight.w600,
                  textColor: AppColors.red,
                ),
                BuildDoubleElement(
                  text: LocaleKeys.uploadYourRadiology.tr(),
                  secoundWidget: EmptyElivatedContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AppText(
                            LocaleKeys.clickOnTheCam.tr(),
                            fontSize: 10.sp,
                          ),
                        ),
                        Icon(
                          Icons.upload_rounded,
                          color: AppColors.red,
                        ),
                      ],
                    ),
                    press: () {
                      myCubit.pickRadiologyImage();
                    },
                  ),
                ),
                BuildDoubleElement(
                  text: LocaleKeys.radiologyType.tr(),
                  secoundWidget: AppDropDownButton(
                    changedValue: myCubit.radiologyType,
                    listOfItems: myCubit.radiologyTypeValues.keys.toList(),
                    onChange: (value) {
                      myCubit.radiologyType = value.toString();
                    },
                  ),
                ),
                BuildDoubleElement(
                  text: LocaleKeys.radiologyArea.tr(),
                  secoundWidget: AppDropDownButton(
                    changedValue: myCubit.radiologyArea,
                    listOfItems: myCubit.radiologyAreaValues.keys.toList(),
                    onChange: (value) {
                      myCubit.radiologyArea = value.toString();
                    },
                  ),
                ),
                BuildDoubleElement(
                  text: LocaleKeys.toClinic.tr(),
                  secoundWidget: AppDropDownButton(
                    changedValue: myCubit.toClinic,
                    listOfItems: myCubit.toClinicValues.keys.toList(),
                    onChange: (value) {
                      myCubit.toClinic = value.toString();
                    },
                  ),
                ),
                HeightSeperator(height: 0.7.h),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppButton(
                    buttonType: ButtonType.add,
                    onPress: () => myCubit.addNewRadiologyCollection(),
                    text: LocaleKeys.add.tr(),
                  ),
                ),
              ],
            ),
          ),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: context.height * 0.18,
                    // width: context.width * 0.5,
                    child: Image(
                      image: Image.file(
                        myCubit.radiologyCollection[index]['image']!,
                        color: AppColors.white,
                      ).image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  AppText(myCubit.radiologyCollection[index]['type']),
                  AppText(myCubit.radiologyCollection[index]['area']),
                  AppText(myCubit.radiologyCollection[index]['clinic']),
                ],
              );
            },
            separatorBuilder: (context, index) => const HeightSeperator(),
            itemCount: myCubit.radiologyCollection.length,
          ),
          const HeightSeperator(),
          // ! Lab
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.babyBlue,
              boxShadow: [
                BoxShadow(
                  color: AppConstants.isCurrentThemeDark
                      ? AppColors.darkBlack
                      : AppColors.leftBoarderGrey,
                  spreadRadius: 0.5,
                  blurRadius: 1,
                  inset: true,
                  offset: const Offset(1, 1),
                  blurStyle: BlurStyle.inner,
                ),
                BoxShadow(
                  color: AppConstants.isCurrentThemeDark
                      ? AppColors.darkBlack
                      : AppColors.rightBoarderGrey,
                  spreadRadius: 0.5,
                  blurRadius: 0,
                  inset: true,
                  offset: const Offset(-1, -1),
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  LocaleKeys.lab.tr(),
                  align: TextAlign.start,
                  fontSize: 15.sp,
                  fontWeigth: FontWeight.w600,
                  textColor: AppColors.red,
                ),
                BuildDoubleElement(
                  text: LocaleKeys.uploadYourTest.tr(),
                  secoundWidget: EmptyElivatedContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AppText(
                            LocaleKeys.clickOnTheCam.tr(),
                            fontSize: 10.sp,
                          ),
                        ),
                        Icon(
                          Icons.upload_rounded,
                          color: AppColors.red,
                        ),
                      ],
                    ),
                    press: () {
                      myCubit.pickLabImage();
                    },
                  ),
                ),
                BuildDoubleElement(
                  text: LocaleKeys.testName.tr(),
                  secoundWidget: AppDropDownButton(
                    changedValue: myCubit.testName,
                    listOfItems: myCubit.testValues.keys.toList(),
                    onChange: (value) {
                      myCubit.testName = value.toString();
                    },
                  ),
                ),
                BuildDoubleElement(
                  text: LocaleKeys.testCategory.tr(),
                  secoundWidget: AppDropDownButton(
                    changedValue: myCubit.testCategory,
                    listOfItems: myCubit.testCategoryValues.keys.toList(),
                    onChange: (value) {
                      myCubit.testCategory = value.toString();
                    },
                  ),
                ),
                BuildDoubleElement(
                  text: LocaleKeys.toClinic.tr(),
                  secoundWidget: AppDropDownButton(
                    changedValue: myCubit.labToClinic,
                    listOfItems: myCubit.toClinicValues.keys.toList(),
                    onChange: (value) {
                      myCubit.labToClinic = value.toString();
                    },
                  ),
                ),
                HeightSeperator(height: 0.7.h),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppButton(
                    buttonType: ButtonType.add,
                    onPress: () => myCubit.addNewLabCollection(),
                    text: LocaleKeys.add.tr(),
                  ),
                ),
              ],
            ),
          ),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: context.height * 0.18,
                    // width: context.width * 0.5,
                    child: Image(
                      image: Image.file(
                        myCubit.labCollection[index]['imaage']!,
                        color: AppColors.white,
                      ).image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  AppText(myCubit.labCollection[index]['testName']),
                  AppText(myCubit.labCollection[index]['testCategory']),
                  AppText(myCubit.labCollection[index]['clinic']),
                ],
              );
            },
            separatorBuilder: (context, index) => const HeightSeperator(),
            itemCount: myCubit.labCollection.length,
          ),
          const HeightSeperator(),

          // * prescription

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.babyBlue,
              boxShadow: [
                BoxShadow(
                  color: AppConstants.isCurrentThemeDark
                      ? AppColors.darkBlack
                      : AppColors.leftBoarderGrey,
                  spreadRadius: 0.5,
                  blurRadius: 1,
                  inset: true,
                  offset: const Offset(1, 1),
                  blurStyle: BlurStyle.inner,
                ),
                BoxShadow(
                  color: AppConstants.isCurrentThemeDark
                      ? AppColors.darkBlack
                      : AppColors.rightBoarderGrey,
                  spreadRadius: 0.5,
                  blurRadius: 0,
                  inset: true,
                  offset: const Offset(-1, -1),
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  LocaleKeys.prescritions.tr(),
                  align: TextAlign.start,
                  fontSize: 15.sp,
                  fontWeigth: FontWeight.w600,
                  textColor: AppColors.red,
                ),
                BuildDoubleElement(
                  text: LocaleKeys.uploadPrescription.tr(),
                  secoundWidget: EmptyElivatedContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: AppText(
                            LocaleKeys.clickOnTheCam.tr(),
                            fontSize: 10.sp,
                          ),
                        ),
                        Icon(
                          Icons.upload_rounded,
                          color: AppColors.red,
                        ),
                      ],
                    ),
                    press: () {
                      myCubit.pickPrescriptionImage();
                    },
                  ),
                ),
                BuildDoubleElement(
                  text: LocaleKeys.toClinic.tr(),
                  secoundWidget: AppDropDownButton(
                    changedValue: myCubit.prescriptionToClinic,
                    listOfItems: myCubit.toClinicValues.keys.toList(),
                    onChange: (value) {
                      myCubit.prescriptionToClinic = value.toString();
                    },
                  ),
                ),
                HeightSeperator(height: 0.7.h),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppButton(
                    buttonType: ButtonType.add,
                    onPress: () => myCubit.addNewPrescriptionCollection(),
                    text: LocaleKeys.add.tr(),
                  ),
                ),
              ],
            ),
          ),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: context.height * 0.18,
                    // width: context.width * 0.5,
                    child: Image(
                      image: Image.file(
                        myCubit.prescriptionCollection[index]['imaage']!,
                        color: AppColors.white,
                      ).image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  AppText(myCubit.prescriptionCollection[index]['clinic']),
                ],
              );
            },
            separatorBuilder: (context, index) => const HeightSeperator(),
            itemCount: myCubit.prescriptionCollection.length,
          ),

          const HeightSeperator(),
        ],
      ),
    );
  }
}

class _SeperatorContainer extends StatelessWidget {
  final String text;
  const _SeperatorContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.lightBlue, borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.symmetric(
        vertical: 0.7.h,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.3.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.edit_square,
                  size: 2.h,
                  color: AppColors.white,
                ),
                AppText(
                  LocaleKeys.edit.tr(),
                  textColor: AppColors.white,
                ),
              ],
            ),
          ),
          Center(
            child: AppText(
              text,
              fontSize: 14.sp,
              fontWeigth: FontWeight.bold,
              textColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
