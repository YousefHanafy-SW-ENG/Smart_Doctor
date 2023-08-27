// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:doctor_final/config/routes/app_routes.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/app_strings.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_double_virtically_widgets.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_overlay_widget.dart';
import 'package:doctor_final/patient/InPatient_data.dart';
import 'package:doctor_final/patient/patient_data.dart';
import 'package:doctor_final/shared/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/shared_wIdgets/app_text.dart';

class BuildSingleRedBar extends StatelessWidget {
  final bool isRadiologyScreen;
  final bool isVisitedScreen;
  final VoidCallback showReportImagePress;
  final VoidCallback showPrescriptionImagePress;
  final VoidCallback shareToPress;
  final String leftText;
  final String rightText;
  final IconData reportIcon;
  final IconData prescriptionIcon;
  final String dateText;
  // final String imageWantToShow;
  final bool showPrescriptionImage;
  final bool showReportImage;
  final prescriptionImage;
  final reportImage;

  const BuildSingleRedBar({
    Key? key,
    required this.isVisitedScreen,
    required this.prescriptionImage,
    required this.showPrescriptionImage,
    required this.showPrescriptionImagePress,
    required this.reportImage,
    required this.showReportImage,
    required this.showReportImagePress,
    required this.isRadiologyScreen,
    required this.shareToPress,
    required this.leftText,
    required this.rightText,
    required this.prescriptionIcon,
    required this.reportIcon,
    required this.dateText,

    // required this.imageWantToShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowResultCubit, ShowResultState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: context.height * 0.02,
                  left: context.width * 0.01,
                  right: context.width * 0.01,
                  // bottom: context.height * 0.02,
                ),
                child: Container(
                  constraints: BoxConstraints(minHeight: context.height * 0.09),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: context.height * 0.02,
                          bottom: context.height * 0.02,
                          left: context.width * 0.01,
                          right: context.width * 0.02,
                        ),
                        child: Row(
                          children: [
                            //share to widget

                            Expanded(
                              child: InkWell(
                                onTap: shareToPress,
                                child: BuildDoubleVirticallyWidget(
                                  icon: Icons.ios_share_outlined,
                                  text: AppStrings.shareTo,
                                ),
                              ),
                            ),

                            // show report image and close the other image
                            if (isRadiologyScreen)
                              Expanded(
                                child: InkWell(
                                    onTap: showReportImagePress,
                                    child: BuildDoubleVirticallyWidget(
                                      icon: reportIcon,
                                      text: AppStrings.showReport,
                                    )),
                              ),

                            // show prescription image and close the other image
                            Expanded(
                              child: InkWell(
                                onTap: showPrescriptionImagePress,
                                child: BuildDoubleVirticallyWidget(
                                  icon: prescriptionIcon,
                                  text: AppStrings.showImage,
                                ),
                              ),
                            ),

                            // // left Text
                            Expanded(
                              flex: 2,
                              child: Text(
                                leftText,
                                textAlign: TextAlign.center,
                                maxLines: 5,
                                // overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        color: AppColors.white, fontSize: 12),
                              ),
                            ),

                            // right text
                            if (!isVisitedScreen)
                              Expanded(
                                flex: 2,
                                child: Text(
                                  rightText,
                                  maxLines: 5,
                                  textAlign: TextAlign.center,
                                  // overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          color: AppColors.white, fontSize: 12),
                                ),
                              ),
                            SizedBox(
                              width: context.width * 0.01,
                            ),
                            // date Text
                            SizedBox(
                              width: context.width * 0.185,
                              child: Text(
                                dateText,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (showPrescriptionImage)
                        InkWell(
                          onTap: () {
                            closeOverLay(context);

                            Navigator.pushNamed(
                              context,
                              Routes.viewImage,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: context.width * 0.01,
                              right: context.width * 0.01,
                            ),
                            child: Container(
                              height: context.height * 0.43,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(prescriptionImage),
                                  fit: BoxFit.fill,
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),

                      // reportImage
                      if (showReportImage)
                        InkWell(
                          onTap: () {
                            closeOverLay(context);
                            Navigator.pushNamed(
                              context,
                              Routes.viewImage,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: context.width * 0.01,
                              right: context.width * 0.01,
                            ),
                            child: Container(
                              height: context.height * 0.43,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(reportImage),
                                  fit: BoxFit.fill,
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BuildSinglePatientBar extends StatelessWidget {
  final String id;
  final String? name;
  final String date;
  final IconData Icon1;
  int? SelectedIndex;

  BuildSinglePatientBar({
    Key? key,
    required this.id,
    required this.name,
    required this.date,
    required this.Icon1,
    required this.SelectedIndex,
    // required this.imageWantToShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                // top: context.height * 0.01,
                //  left: context.width * 0.01,
                // right: context.width * 0.01,
                // bottom: context.height * 0.02,
                ),
            child: Container(
              height: 11.h,
              constraints: BoxConstraints(minHeight: context.height * 0.010),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          // top: context.height * 0.02,
                          // bottom: context.height * 0.02,
                          // left: context.width * 0.01,
                          // right: context.width * 0.02,
                          ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Expanded(
                              child: Center(
                                child: Text(
                                  id,
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              )),
                          SizedBox(
                            width: 6.w,
                          ),
                          Expanded(
                              child: Text(
                            name!,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                          SizedBox(
                            width: 6.w,
                          ),
                          // SizedBox(width:10.w,),
                          Expanded(
                              child: Text(
                            date,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                          // SizedBox(width:15.w,),
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  selectedIndexxx = SelectedIndex!;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PatientData()));
                                },
                                child: Icon(
                                  Icons.play_circle,
                                  color: Colors.white,
                                  size: 58,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildSingleVisitBar extends StatelessWidget {
  final String name;
  final String date;
  final IconData Icon1;
  // final IconData prescriptionIcon;
  // final String dateText;
  // // final String imageWantToShow;
  // final bool showPrescriptionImage;
  // final bool showReportImage;
  // final prescriptionImage;
  // final reportImage;

  const BuildSingleVisitBar({
    Key? key,
    required this.name,
    required this.date,
    required this.Icon1,
    // required this.imageWantToShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                // top: context.height * 0.01,
                //  left: context.width * 0.01,
                // right: context.width * 0.01,
                // bottom: context.height * 0.02,
                ),
            child: Container(
              height: 11.h,
              constraints: BoxConstraints(minHeight: context.height * 0.010),
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          // top: context.height * 0.02,
                          // bottom: context.height * 0.02,
                          // left: context.width * 0.01,
                          // right: context.width * 0.02,
                          ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            date,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            width: 10.5.w,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PatientData()));
                              },
                              child: Icon(
                                Icons.arrow_drop_up_sharp,
                                color: Colors.white,
                                size: 75,
                              )),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildSingleInPatientBar extends StatelessWidget {
  final String id;
  final String name;
  final String date;
  final IconData Icon1;
  final int user_selected_index;
  // final IconData prescriptionIcon;
  // final String dateText;
  // // final String imageWantToShow;
  // final bool showPrescriptionImage;
  // final bool showReportImage;
  // final prescriptionImage;
  // final reportImage;

  BuildSingleInPatientBar({
    Key? key,
    required this.id,
    required this.name,
    required this.date,
    required this.Icon1,
    required this.user_selected_index,
    // required this.imageWantToShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Container(
            height: 11.h,
            constraints: BoxConstraints(minHeight: context.height * 0.010),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: AppText(
                          id,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AppText(
                        name,
                        textColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: AppText(
                        date,
                        textColor: Colors.white,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Selected_index = user_selected_index;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InpatientData()));
                        },
                        child: Icon(
                          Icons.play_circle,
                          color: Colors.white,
                          size: 58,
                        )),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}




class BuildSingleAccBar extends StatelessWidget {
  final String name;
  final String date;
  final IconData Icon1;
  // final IconData prescriptionIcon;
  // final String dateText;
  // // final String imageWantToShow;
  // final bool showPrescriptionImage;
  // final bool showReportImage;
  // final prescriptionImage;
  // final reportImage;


  const BuildSingleAccBar({
    Key? key,
    required this.name,
    required this.date,
    required this.Icon1,
    // required this.imageWantToShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              // top: context.height * 0.01,
              //  left: context.width * 0.01,
              // right: context.width * 0.01,
              // bottom: context.height * 0.02,
            ),
            child: Container(
              height: 12.h,
              constraints: BoxConstraints(minHeight: context.height * 0.010),
              decoration: BoxDecoration(
                color: Colors.red[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        // top: context.height * 0.02,
                        // bottom: context.height * 0.02,
                        left: context.width * 0.05,
                        // right: context.width * 0.02,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex:2,
                              child: Text(name,style: TextStyle(color: Colors.white,fontSize: 16),)),
                          SizedBox(width:6.w,),
                          Expanded(
                            flex: 2,
                              child: Text(date,style: TextStyle(color: Colors.white,fontSize: 18),)),
                          SizedBox(width:3.w,),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientData()));
                                },
                                child: Icon(Icons.arrow_drop_up_sharp,color: Colors.white,size: 75,)),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
