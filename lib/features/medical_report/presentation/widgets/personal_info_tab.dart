import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/features/login/presentation/widgets/height_seperator.dart';
import 'package:doctor_final/features/medical_report/presentation/cubit/medical_report_cubit.dart';
import 'package:doctor_final/features/signup/presentation/widgets/build_double_element.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'decorated_text_in_container.dart';

class PersonalInfoTab extends StatelessWidget {
  const PersonalInfoTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myCubit = MedicalReportCubit.getCubit(context);
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        //profile image
        const HeightSeperator(),
        CircleAvatar(
          backgroundColor: AppColors.red,
          radius: 12.w,
          child: CircleAvatar(
            foregroundImage: myCubit.profileImage != null
                ? Image.file(myCubit.profileImage!).image
                : NetworkImage(ImageManager.personImageUrl),
            radius: 11.2.w,
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.firstName.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Pola',
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.secoundName.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'wahba',
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.thirdName.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'bader',
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.familyName.tr(),
          secoundWidget: const DecoratedTextInContainer(
            '',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.nationality.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Egyption',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.gender.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Male',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.idType.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'National ID',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.idNumber.tr(),
          secoundWidget: const DecoratedTextInContainer(
            '012014231201121341',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.idNumber.tr(),
          secoundWidget: const DecoratedTextInContainer(
            '012014231201121341',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.mobileNumber.tr(),
          secoundWidget: const DecoratedTextInContainer(
            '01012096738',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.homePhone.tr(),
          secoundWidget: const DecoratedTextInContainer(
            '24927404',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.yourAdress.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Egypt-Cairo',
          ),
        ),

        BuildDoubleElement(
          text: LocaleKeys.dateOfBirth.tr(),
          secoundWidget: const DecoratedTextInContainer(
            '20 - 8 - 1998',
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.religion.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Christian',
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.job.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Developer',
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.maritalStatus.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Married',
          ),
        ),
        BuildDoubleElement(
          text: LocaleKeys.email.tr(),
          secoundWidget: const DecoratedTextInContainer(
            'Pola.wahba2@gmail.com',
          ),
        ),
        const HeightSeperator(),

        // BuildDoubleElement(
        //   text: LocaleKeys.email.tr(),
        //   secoundWidget: const DecoratedTextInContainer(
        //       'Pola.wahba2@gmail.com'),
        // ),
        // SizedBox(
        //   height: context.height * 0.015,
        // ),
        // //upload image
        // InkWell(
        //   onTap: () {
        //     myCubit.pickProfileImage();
        //   },
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       const Icon(
        //         Icons.file_upload_outlined,
        //       ),
        //       Text(
        //         LocaleKeys.uploadPhoto.tr(),
        //         style: Theme.of(context).textTheme.displaySmall,
        //       ),
        //     ],
        //   ),
        // ),
        // //full name
        // BuildDoubleElement(
        //   text: LocaleKeys.fullName.tr(),
        //   secoundWidget: InsetTextFieldContainer(
        //     child: TextFormField(
        //       style: TextStyle(
        //         color: AppConstants.isCurrentThemeDark
        //             ? AppColors.white
        //             : AppColors.black,
        //       ),
        //       controller: myCubit.fullNameController,
        //       decoration: InputDecoration(
        //         contentPadding: loginCubit.toggleText == 'العربية'
        //             ? EdgeInsets.only(
        //                 left: context.width * 0.04,
        //                 top: context.width * 0.04,
        //                 bottom: context.width * 0.02,
        //               )
        //             : EdgeInsets.only(
        //                 top: context.width * 0.04,
        //                 right: context.width * 0.04,
        //                 bottom: context.width * 0.02,
        //               ),
        //         border: InputBorder.none,
        //       ),
        //       validator: (value) {
        //         if (value == null ||
        //             value.isEmpty ||
        //             value.length < 3) {
        //           return '    Enter valid Name';
        //         }
        //         return null;
        //       },
        //     ),
        //   ),
        // ),
        // //gender
        // // BuildDoubleElement(
        // //   text: LocaleKeys.gender.tr(),
        // //   secoundWidget: BuildRadioButton(
        // //     controllerName: LocaleKeys.gender.tr(),
        // //     elements: [
        // //       LocaleKeys.male.tr(),
        // //       LocaleKeys.female.tr(),
        // //     ],
        // //     valurController:
        // //         MedicalReportCubit.getCubit(context)
        // //             .genderSelectedElementIndex,
        // //   ),
        // // ),
        // //id Type
        // // BuildDoubleElement(
        // //   text: LocaleKeys.idType.tr(),
        // //   secoundWidget: BuildRadioButton(
        // //     controllerName: LocaleKeys.idType.tr(),
        // //     elements: [
        // //       LocaleKeys.nationalId.tr(),
        // //       LocaleKeys.passport.tr(),
        // //     ],
        // //     valurController:
        // //         MedicalReportCubit.getCubit(context)
        // //             .idTypeSelectedElementIndex,
        // //   ),
        // // ),
        // //id number
        // BuildDoubleElement(
        //   text: LocaleKeys.idNumber.tr(),
        //   secoundWidget: InsetTextFieldContainer(
        //     child: TextFormField(
        //       style: TextStyle(
        //         color: AppConstants.isCurrentThemeDark
        //             ? AppColors.white
        //             : AppColors.black,
        //       ),
        //       keyboardType: TextInputType.number,
        //       controller: myCubit.idNumberController,
        //       decoration: InputDecoration(
        //         contentPadding: loginCubit.toggleText == 'العربية'
        //             ? EdgeInsets.only(
        //                 left: context.width * 0.04,
        //                 top: context.width * 0.04,
        //                 bottom: context.width * 0.02,
        //               )
        //             : EdgeInsets.only(
        //                 top: context.width * 0.04,
        //                 right: context.width * 0.04,
        //                 bottom: context.width * 0.02,
        //               ),
        //         border: InputBorder.none,
        //       ),
        //       validator: (value) {
        //         if (value == null ||
        //             value.isEmpty ||
        //             value.length < 10) {
        //           return 'id Number should be more than 8 Numbers';
        //         }
        //         return null;
        //       },
        //     ),
        //   ),
        // ),
        // //upload your id
        // BuildDoubleElement(
        //   text: LocaleKeys.uploadYourId.tr(),
        //   secoundWidget: EmptyElivatedContainer(
        //     press: () {
        //       myCubit.pickIdImages();
        //     },
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Icon(
        //           Icons.file_upload_outlined,
        //           color: AppConstants.isCurrentThemeDark
        //               ? AppColors.white
        //               : AppColors.darkBlack,
        //         ),
        //         Text(
        //           LocaleKeys.uploadPhoto.tr(),
        //           style: Theme.of(context)
        //               .textTheme
        //               .displaySmall!
        //               .copyWith(fontSize: 15),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        // //picked id image
        // if (myCubit.idImage != null)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 12.0),
        //     child: SizedBox(
        //       height: context.height * 0.13,
        //       width: context.width * 0.5,
        //       child: Image(
        //         image: Image.file(
        //           myCubit.idImage!,
        //           color: AppColors.white,
        //         ).image,
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //   ),

        // //mobile phone
        // BuildDoubleElement(
        //   text: LocaleKeys.mobileNumber.tr(),
        //   secoundWidget: InsetPhoneWidgetMedicalReport(
        //     controller: myCubit.mobildNumberController,
        //     isMobileNumber: true,
        //   ),
        // ),
        // //home phone
        // BuildDoubleElement(
        //   text: LocaleKeys.homePhone.tr(),
        //   secoundWidget: InsetPhoneWidgetMedicalReport(
        //     controller: myCubit.homePhoneController,
        //     isMobileNumber: true,
        //   ),
        // ),

        // //adress
        // BuildDoubleElement(
        //   text: LocaleKeys.yourAdress.tr(),
        //   secoundWidget: InsetTextFieldContainer(
        //     child: TextFormField(
        //       style: TextStyle(
        //         color: AppConstants.isCurrentThemeDark
        //             ? AppColors.white
        //             : AppColors.black,
        //       ),
        //       controller: myCubit.adressController,
        //       decoration: InputDecoration(
        //         contentPadding: loginCubit.toggleText == 'العربية'
        //             ? EdgeInsets.only(
        //                 left: context.width * 0.04,
        //                 top: context.width * 0.04,
        //                 bottom: context.width * 0.02,
        //               )
        //             : EdgeInsets.only(
        //                 top: context.width * 0.04,
        //                 right: context.width * 0.04,
        //                 bottom: context.width * 0.02,
        //               ),
        //         border: InputBorder.none,
        //       ),
        //       validator: (value) {
        //         if (value == null ||
        //             value.isEmpty ||
        //             value.length < 7) {
        //           return '  Enter at least 7 Chars';
        //         }
        //         return null;
        //       },
        //     ),
        //   ),
        // ),

        // //date of birth
        // BuildDoubleElement(
        //   text: LocaleKeys.dateOfBirth.tr(),
        //   secoundWidget: EmptyElivatedContainer(
        //     press: () async {
        //       try {
        //         await showDatePicker(
        //           context: context,
        //           initialDate: DateTime.now(),
        //           firstDate: DateTime.parse("1960-01-01"),
        //           lastDate: DateTime.now(),
        //         ).then((value) {
        //           if (value != null) {
        //             myCubit.changeDateController(
        //                 value: DateFormat('yyyy-MM-dd')
        //                     .format(value)
        //                     .toString());
        //           }
        //         });
        //       } catch (e) {
        //         showToast(text: e.toString());
        //       }
        //     },
        //     child: Row(
        //       children: [
        //         Align(
        //           alignment: AlignmentDirectional.centerStart,
        //           child: SizedBox(
        //             height: context.height * 0.04,
        //             width: context.width * 0.066,
        //             child: Image.asset(
        //               ImageManager.calender,
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding:
        //               EdgeInsets.only(left: context.width * 0.13),
        //           child: Text(
        //             myCubit.dateOfBirth,
        //             style: Theme.of(context).textTheme.bodyLarge,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        // // upper drop button
        // BuildDoubleElement(
        //   text: LocaleKeys.maritalStatus.tr(),
        //   secoundWidget: EmptyElivatedContainer(
        //     press: () {},
        //     child: Align(
        //       alignment: AlignmentDirectional.centerEnd,
        //       child: DropdownButton(
        //         isExpanded: true,
        //         underline: const SizedBox(),
        //         // value: myCubit.,
        //         items: myCubit.maritalStatusValues.map((items) {
        //           return DropdownMenuItem(
        //             value: items,
        //             child: Text(
        //               items,
        //               // style: TextStyle(),
        //             ),
        //           );
        //         }).toList(),
        //         onChanged: (value) {
        //           myCubit.changeMaritalStautsValue(
        //               value: value.toString());
        //         },

        //         iconSize: 30,
        //         hint: myCubit.maritalStautsValue == ''
        //             ? Text(
        //                 'Select Your Marital status',
        //                 style: Theme.of(context)
        //                     .textTheme
        //                     .bodyLarge!
        //                     .copyWith(fontSize: 13),
        //               )
        //             : Text(
        //                 myCubit.maritalStautsValue,
        //                 style: Theme.of(context)
        //                     .textTheme
        //                     .bodyLarge!
        //                     .copyWith(fontSize: 13),
        //               ),
        //         iconEnabledColor: AppColors.primaryColor,
        //       ),
        //     ),
        //   ),
        // ),

        // //
        // BuildDoubleElement(
        //   text: LocaleKeys.insuranceCompany.tr(),
        //   secoundWidget: EmptyElivatedContainer(
        //     press: () {},
        //     child: Align(
        //       alignment: AlignmentDirectional.centerEnd,
        //       child: DropdownButton(
        //         isExpanded: true,
        //         underline: const SizedBox(),
        //         // value: myCubit.,
        //         items: myCubit.insuranceCompanyValues.map((items) {
        //           return DropdownMenuItem(
        //             value: items,
        //             child: Text(
        //               items,
        //               // style: TextStyle(),
        //             ),
        //           );
        //         }).toList(),
        //         onChanged: (value) {
        //           myCubit.changeInsuranceCompanyValue(
        //               value: value.toString());
        //         },

        //         iconSize: 30,
        //         hint: myCubit.insuranceCompanyValue == ''
        //             ? Text(
        //                 'Insurance Company',
        //                 style: Theme.of(context)
        //                     .textTheme
        //                     .bodyLarge!
        //                     .copyWith(fontSize: 13),
        //               )
        //             : Text(
        //                 myCubit.insuranceCompanyValue,
        //                 style: Theme.of(context)
        //                     .textTheme
        //                     .bodyLarge!
        //                     .copyWith(fontSize: 13),
        //               ),
        //         iconEnabledColor: AppColors.primaryColor,
        //       ),
        //     ),
        //   ),
        // ),
        // //

        // //insurance number

        // BuildDoubleElement(
        //   text: LocaleKeys.insuranceNumber.tr(),
        //   secoundWidget: InsetTextFieldContainer(
        //     child: TextFormField(
        //       style: TextStyle(
        //         color: AppConstants.isCurrentThemeDark
        //             ? AppColors.white
        //             : AppColors.black,
        //       ),
        //       keyboardType: TextInputType.number,
        //       controller: myCubit.insuranceNumberController,
        //       decoration: InputDecoration(
        //         contentPadding: loginCubit.toggleText == 'العربية'
        //             ? EdgeInsets.only(
        //                 left: context.width * 0.04,
        //                 top: context.width * 0.04,
        //                 bottom: context.width * 0.02,
        //               )
        //             : EdgeInsets.only(
        //                 top: context.width * 0.04,
        //                 right: context.width * 0.04,
        //                 bottom: context.width * 0.02,
        //               ),
        //         border: InputBorder.none,
        //       ),
        //       validator: (value) {
        //         if (value == null ||
        //             value.isEmpty ||
        //             value.length < 10) {
        //           return 'Enter at least 10 numbers';
        //         }
        //         return null;
        //       },
        //     ),
        //   ),
        // ),

        // const HeightSeperator(),
        // MyButton(
        //   color: AppColors.primaryColor,
        //   press: () {
        //     if (medicalReportFormKey.currentState!.validate()) {
        //       if (myCubit.dateOfBirth != '3-2-1999' &&
        //           (myCubit.maritalStautsValue != '') &&
        //           (myCubit.insuranceCompanyValue != '' &&
        //               myCubit.idImage != null &&
        //               myCubit.profileImage != null)) {
        //         myCubit.clearAllMedicalReportScreenControllers();
        //         Navigator.pushNamed(
        //             context, Routes.dataSavedSuccess);
        //       } else {
        //         showToast(
        //             text:
        //                 'Please make sure to upload all required images and dates');
        //       }
        //     }
        //   },
        //   text: 'Save Data',
        // ),

        // const HeightSeperator(),
      ],
    );
  }
}
