import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/shared_wIdgets/app_text.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../../core/uitls/image_manager.dart';
import '../../../../translation/Local_Key.g.dart';
import '../../../chat/presentation/widgets/my_button.dart';
import '../../../login/presentation/widgets/height_seperator.dart';
import '../../../signup/presentation/widgets/build_double_element.dart';
import '../cubit/medical_report_cubit.dart';
import '../widgets/decorated_text_in_container.dart';

// class Personal_data extends StatelessWidget {
//   const Personal_data({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var Display_Height_cont = TextEditingController();
//     var Display_Height_Unit_cont = TextEditingController();
//     Display_Height_cont.text = "180";
//     Display_Height_Unit_cont.text = "Cm";
//
//     var myCubit = MedicalReportCubit.getCubit(context);
//     return ListView(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       children: [
//         //profile image
//         const HeightSeperator(),
//
//         Row(
//           children: [
//             Expanded(
//               flex: 4,
//               child: CircleAvatar(
//                 backgroundColor: AppColors.red,
//                 radius: 10.w,
//                 child: CircleAvatar(
//                   foregroundImage: myCubit.profileImage != null
//                       ? Image.file(myCubit.profileImage!).image
//                       : NetworkImage(ImageManager.personImageUrl),
//                   radius: 9.2.w,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 8,
//               child: DecoratedTextInContainer(
//                 'Ali Ahmed',
//               ),
//             ),
//           ],
//         ),
//
//         BuildDoubleElement(
//           text: LocaleKeys.PatientId.tr(),
//           secoundWidget: const DecoratedTextInContainer(
//             '204552562',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: LocaleKeys.gender.tr(),
//           secoundWidget: const DecoratedTextInContainer(
//             'Male',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: LocaleKeys.Age.tr(),
//           secoundWidget: const DecoratedTextInContainer(
//             '54',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Id Type",
//           secoundWidget: const DecoratedTextInContainer(
//             'Egyptian',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Id Number",
//           secoundWidget: const DecoratedTextInContainer(
//             '7014855025141',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Mobile Number",
//           secoundWidget: const DecoratedTextInContainer(
//             '01018768028',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Home Number",
//           secoundWidget: const DecoratedTextInContainer(
//             '0233962384',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "your Address",
//           secoundWidget: const DecoratedTextInContainer(
//             '4 Elmarwa Helioplis,Cairo',
//           ),
//         ),
//
//         BuildDoubleElement(
//             text: "Date of Birth",
//             secoundWidget: Display_DateOnly(
//               Date: "2022/05/07",
//             )),
//
//         BuildDoubleElement(
//           text: LocaleKeys.job.tr(),
//           secoundWidget: const DecoratedTextInContainer(
//             '',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Marital Status",
//           secoundWidget: const DecoratedTextInContainer(
//             'Married',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: LocaleKeys.Allergies.tr(),
//           secoundWidget: const DecoratedTextInContainer(
//             ' pollen, dust, animal fur, foods',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: LocaleKeys.ChronicDisease.tr(),
//           secoundWidget: const DecoratedTextInContainer(
//             'swallowing, confusion, dizziness, and fainting',
//           ),
//         ),
//
//         Container(
//           margin: EdgeInsets.only(top: context.height * 0.015),
//           child: MyButton(
//             press: () {},
//             text: "Insurance",
//             color: AppColors.blue,
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Name",
//           secoundWidget: const DecoratedTextInContainer(
//             'Insurance Name',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Company",
//           secoundWidget: const DecoratedTextInContainer(
//             'Insurance Company Name',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Type",
//           secoundWidget: const DecoratedTextInContainer(
//             'Insurance Type',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Id",
//           secoundWidget: const DecoratedTextInContainer(
//             '045471',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Level",
//           secoundWidget: const DecoratedTextInContainer(
//             'Insurance Level',
//           ),
//         ),
//
//         Container(
//           margin: EdgeInsets.only(top: context.height * 0.015),
//           child: MyButton(
//             press: () {},
//             text: "Medical Info",
//             color: AppColors.blue,
//           ),
//         ),
//
//         Container(
//           margin: EdgeInsets.only(top: context.height * 0.015),
//           child: MyButton(
//             press: () {},
//             text: "Medical Data",
//             color: AppColors.blue,
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: LocaleKeys.yourHeight.tr(),
//           secoundWidget: Double_decorated_text_in_container("", "Kg"),
//         ),
//
//         BuildDoubleElement(
//           text: LocaleKeys.yourHeight.tr(),
//           secoundWidget: Double_decorated_text_in_container("", "Kg/M²"),
//         ),
//
//         BuildDoubleElement(
//           text: LocaleKeys.bloodType.tr(),
//           secoundWidget: const DecoratedTextInContainer(
//             'O RhD positive (O+)',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Smoking",
//           secoundWidget: const DecoratedTextInContainer(
//             'Smoking Status',
//           ),
//         ),
//
//         Container(
//           margin: EdgeInsets.only(top: context.height * 0.015),
//           child: MyButton(
//             press: () {},
//             text: "Medical History",
//             color: AppColors.blue,
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Please add diagnosis if you have any",
//           secoundWidget: const DecoratedTextInContainer(
//             '',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Please add allergies if you have any",
//           secoundWidget: const DecoratedTextInContainer(
//             '',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Please add operations if you did any",
//           secoundWidget: const DecoratedTextInContainer(
//             '',
//           ),
//         ),
//
//         BuildDoubleElement(
//           text: "Please add Medication if you have take any",
//           secoundWidget: const DecoratedTextInContainer(
//             '',
//           ),
//         ),
//
//         const HeightSeperator(),
//
//         Container(
//           margin: EdgeInsets.only(top: context.height * 0.015),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.babyBlue,
//             // shape: BoxShape.circle,
//           ),
//           child: PersonalData_Card_widget(
//             title_name:"Radiology" ,
//             item_count:3 ,
//           ),
//         ),
//
//
//
//
//
//         Container(
//           margin: EdgeInsets.only(top: context.height * 0.015),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.babyBlue,
//             // shape: BoxShape.circle,
//           ),
//           child: PersonalData_Card_widget(
//             title_name:"Lab" ,
//             item_count:2 ,
//
//           ),
//         ),
//
//
//
//
//
//
//
//
//
//
//
//         SizedBox(
//           height: 300,
//         ),
//       ],
//     );
//   }
// }

class Display_DateOnly extends StatelessWidget {
  final String Date;

  const Display_DateOnly({
    this.Date = "2021/01/05",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.h,
      padding: EdgeInsets.symmetric(horizontal: 1.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(-2, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Date,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
            ),
            overflow: TextOverflow.visible,
          ),
          SizedBox(
            height: 3.h,
            child: Image.asset('assets/images/calender.png'),
          ),
        ],
      ),
    );
  }
}

class Double_decorated_text_in_container extends StatelessWidget {
  final String text1;
  final String text2;
  const Double_decorated_text_in_container(this.text1, this.text2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(
                      0,
                      2,
                    ),
                  ),
                ],
              ),
              child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: AppText(
                      text1,
                    ),
                  )),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(
                    0,
                    2,
                  ),
                ),
              ],
            ),
            child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: AppText(
                    text2,
                    textColor: AppColors.red,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

// class PersonalData_Card_widget extends StatelessWidget {
//   String title_name;
//   int item_count;
//   PersonalData_Card_widget({
//     super.key,
//     required this.title_name,
//     this.item_count = 3,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15,bottom: 5, left: 10,right: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           Padding(
//             padding: const EdgeInsets.only(bottom: 15),
//             child: AppText(
//               title_name,
//               textColor: AppColors.red,
//               fontWeigth: FontWeight.bold,
//             ),
//           ),
//
//
//           ListView.builder(
//
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: item_count,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: EdgeInsets.only(bottom: 10),
//                 child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: AppColors.white,
//                     // shape: BoxShape.circle,
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: GestureDetector(
//                               onTap: () async {
//                                 // Api_method_call New_object=Api_method_call(
//                                 //   End_point_url:"/api/v1/create" ,
//                                 //   MyData:{
//                                 //     "name":"test",
//                                 //     "salary":"123",
//                                 //     "age":"23"
//                                 //     } ,
//                                 //   Response_value_Variable: Login_Api_Response
//                                 //   );
//
//                                 //   await New_object.Call_Api_method();
//                               },
//                               child: Center(child: AppText("pic")))),
//                       Expanded(
//                         child: Center(child: AppText("Name")),
//                       ),
//                       Expanded(
//                         child: Center(child: AppText("Clinic")),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }