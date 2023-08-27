import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/config/routes/app_routes.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/app_strings.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/home/presentation/widgets/my_app_bar.dart';
import 'package:doctor_final/features/login/presentation/widgets/back_ground.dart';
import 'package:doctor_final/features/login/presentation/widgets/my_button.dart';
import 'package:doctor_final/features/login/presentation/widgets/height_seperator.dart';
import 'package:doctor_final/features/medical_report/presentation/cubit/medical_report_cubit.dart';
import 'package:doctor_final/features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import 'package:doctor_final/features/medical_report/presentation/widgets/inset_phone_widget_medical_report.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/show_toast.dart';
import 'package:doctor_final/features/signup/presentation/widgets/build_double_element.dart';
import 'package:doctor_final/features/signup/presentation/widgets/empty_elivated_container.dart';
import 'package:doctor_final/features/signup/presentation/widgets/inset_text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FillYourDataScreen extends StatelessWidget {
  final medicalReportFormKey = GlobalKey<FormState>();

  FillYourDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalReportCubit, MedicalReportStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var myCubit = MedicalReportCubit.getCubit(context);
        return Scaffold(
          appBar: myAppBar(
            backButton_onClick: () {
              
            },
            appTitle: BuildAppBarTitleWidget(
              image: ImageManager.medicalReport,
              text: AppStrings.fillYourData.tr(),
            ),
            centerTitle: true,
            hasBackArrow: true,
            context: context,
          ),
          body: BackGround(
            isContainAppBar: true,
            screen: SingleChildScrollView(
              child: Form(
                key: medicalReportFormKey,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: context.height * 0.01,
                    left: context.height * 0.015,
                    right: context.height * 0.01,
                    bottom: context.height * 0.03,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //full name

                        //gender
                        // BuildDoubleElement(
                        //   text: AppStrings.gender.tr(),
                        //   secoundWidget: BuildRadioButton(
                        //     controllerName: AppStrings.gender.tr(),
                        //     elements: [
                        //       AppStrings.male,
                        //       AppStrings.female,
                        //     ],
                        //     valurController:
                        //         MedicalReportCubit.getCubit(context)
                        //             .genderSelectedElementIndex,
                        //   ),
                        // ),
                        //id Type
                        // BuildDoubleElement(
                        //   text: AppStrings.idType.tr(),
                        //   secoundWidget: BuildRadioButton(
                        //     controllerName: AppStrings.idType.tr(),
                        //     elements: [
                        //       AppStrings.nationalId,
                        //       AppStrings.passport,
                        //     ],
                        //     valurController:
                        //         MedicalReportCubit.getCubit(context)
                        //             .idTypeSelectedElementIndex,
                        //   ),
                        // ),
                        // //id number
                        BuildDoubleElement(
                          text: AppStrings.idNumber.tr(),
                          secoundWidget: InsetTextFieldContainer(
                            child: TextFormField(
                              controller: myCubit.idNumberController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 10) {
                                  return 'id Number should be more than 8 Numbers';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        //upload your id
                        BuildDoubleElement(
                          text: AppStrings.uploadYourId.tr(),
                          secoundWidget: EmptyElivatedContainer(
                            press: () {
                              myCubit.pickIdImages();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.file_upload_outlined,
                                  color: AppColors.black,
                                ),
                                Text(
                                  AppStrings.uploadPhoto.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //picked id image
                        if (myCubit.idImage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: SizedBox(
                              height: context.height * 0.13,
                              width: context.width * 0.5,
                              child: Image(
                                image: Image.file(
                                  myCubit.idImage!,
                                  color: AppColors.white,
                                ).image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),

                        //mobile phone
                        BuildDoubleElement(
                          text: AppStrings.mobileNumber.tr(),
                          secoundWidget: InsetPhoneWidgetMedicalReport(
                            controller: myCubit.mobildNumberController,
                            isMobileNumber: true,
                          ),
                        ),
                        //home phone
                        BuildDoubleElement(
                          text: AppStrings.homePhone.tr(),
                          secoundWidget: InsetPhoneWidgetMedicalReport(
                            controller: myCubit.homePhoneController,
                            isMobileNumber: true,
                          ),
                        ),

                        //adress
                        BuildDoubleElement(
                          text: AppStrings.yourAdress.tr(),
                          secoundWidget: InsetTextFieldContainer(
                            child: TextFormField(
                              controller: myCubit.adressController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 7) {
                                  return '  Enter at least 7 Chars';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),

                        //date of birth
                        BuildDoubleElement(
                          text: AppStrings.dateOfBirth.tr(),
                          secoundWidget: EmptyElivatedContainer(
                            press: () async {
                              try {
                                await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.parse("1960-01-01"),
                                  lastDate: DateTime.now(),
                                ).then((value) {
                                  if (value != null) {
                                    myCubit.changeDateController(
                                        value: DateFormat('yyyy-MM-dd')
                                            .format(value)
                                            .toString());
                                  }
                                });
                              } catch (e) {
                                showToast(text: e.toString());
                              }
                            },
                            child: Row(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: SizedBox(
                                    height: context.height * 0.04,
                                    width: context.width * 0.066,
                                    child: Image.asset(
                                      ImageManager.calender,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: context.width * 0.13),
                                  child: Text(
                                    myCubit.dateOfBirth,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // upper drop button
                        BuildDoubleElement(
                          text: AppStrings.maritalStatus.tr(),
                          secoundWidget: EmptyElivatedContainer(
                            press: () {},
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: DropdownButton(
                                isExpanded: true,
                                underline: const SizedBox(),
                                // value: myCubit.,
                                items: myCubit.maritalStatusValues.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      // style: TextStyle(),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  myCubit.changeMaritalStautsValue(
                                      value: value.toString());
                                },

                                iconSize: 30,
                                hint: myCubit.maritalStautsValue == ''
                                    ? Text(
                                        'Select Your Marital status',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 13),
                                      )
                                    : Text(
                                        myCubit.maritalStautsValue,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 13),
                                      ),
                                iconEnabledColor: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),

                        //
                        BuildDoubleElement(
                          text: AppStrings.insuranceCompany.tr(),
                          secoundWidget: EmptyElivatedContainer(
                            press: () {},
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: DropdownButton(
                                isExpanded: true,
                                underline: const SizedBox(),
                                // value: myCubit.,
                                items:
                                    myCubit.insuranceCompanyValues.map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      // style: TextStyle(),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  myCubit.changeInsuranceCompanyValue(
                                      value: value.toString());
                                },

                                iconSize: 30,
                                hint: myCubit.insuranceCompanyValue == ''
                                    ? Text(
                                        'Insurance Company',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 13),
                                      )
                                    : Text(
                                        myCubit.insuranceCompanyValue,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(fontSize: 13),
                                      ),
                                iconEnabledColor: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        //

                        //insurance number

                        BuildDoubleElement(
                          text: AppStrings.insuranceNumber,
                          secoundWidget: InsetTextFieldContainer(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: myCubit.insuranceNumberController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 10) {
                                  return '  Enter at least 10 numbers';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        BuildDoubleElement(
                          text: AppStrings.uploadYourId,
                          secoundWidget: EmptyElivatedContainer(
                            press: () {
                              myCubit.pickIdImages();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(
                                  Icons.file_upload_outlined,
                                  color: AppColors.black,
                                ),
                                Text(
                                  AppStrings.uploadPhoto,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const HeightSeperator(),
                        MyButton(
                          color: AppColors.primaryColor,
                          press: () {
                            if (medicalReportFormKey.currentState!.validate()) {
                              if (myCubit.dateOfBirth != '3-2-1999' &&
                                  (myCubit.maritalStautsValue != '') &&
                                  (myCubit.insuranceCompanyValue != '' &&
                                      myCubit.idImage != null &&
                                      myCubit.profileImage != null)) {
                                myCubit
                                    .clearAllMedicalReportScreenControllers();
                                Navigator.pushNamed(
                                    context, Routes.dataSavedSuccess);
                              } else {
                                showToast(
                                    text:
                                        'Please make sure to upload all required images and dates');
                              }
                            }
                          },
                          text: 'Save Data',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
