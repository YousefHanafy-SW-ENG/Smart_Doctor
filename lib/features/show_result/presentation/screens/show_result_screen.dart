import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/config/routes/app_routes.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/home/presentation/widgets/my_app_bar.dart';
import 'package:doctor_final/features/login/presentation/widgets/back_ground.dart';
import 'package:doctor_final/features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import 'package:doctor_final/features/show_result/presentation/screens/screen_arguments.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_single_card.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';

import '../../../../patient/patient_data.dart';

class ShowResultScreen extends StatelessWidget {
  const ShowResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallDisplay = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: myAppBar(
        backButton_onClick: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientData()
              ));
        },
        appTitle: BuildAppBarTitleWidget(
          image: ImageManager.showRes,
          text: LocaleKeys.showResults.tr(),
        ),
        centerTitle: true,
        hasBackArrow: true,
        context: context,
      ),
      body: BackGround(
        isContainAppBar: true,
        screen: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            childAspectRatio: AppConstants.weRunOnWeb
                ? 9 / 6
                : isSmallDisplay
                    ? 4 / 6
                    : 10 / 4,
            crossAxisCount: AppConstants.weRunOnWeb
                ? responsiveGridViewCount(context.width)
                : 2,
            mainAxisSpacing: context.height * 0.05,
            crossAxisSpacing: context.width * 0.05,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.spacificResult,
                      arguments: ScreenArguments(
                        title: LocaleKeys.labResult.tr(),
                        image: ImageManager.blood,
                      ));
                },
                child: BuildSingleCard(
                  image: ImageManager.blood,
                  text: LocaleKeys.labResult.tr(),
                  notificationNumber: 3,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.readiologyScreen,
                      arguments: ScreenArguments(
                        title: LocaleKeys.radiologyResult.tr(),
                        image: ImageManager.prescriptions,
                      ));
                },
                child: BuildSingleCard(
                  text: LocaleKeys.radiologyResult.tr(),
                  image: ImageManager.radiology,
                  notificationNumber: 3,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.spacificResult,
                      arguments: ScreenArguments(
                        title: LocaleKeys.prescritions.tr(),
                        image: ImageManager.prescriptions,
                      ));
                },
                child: BuildSingleCard(
                  image: ImageManager.prescriptions,
                  text: LocaleKeys.prescritions.tr(),
                  notificationNumber: 3,
                ),
              ),
            ],
          ),
          // child: Wrap(

          //   children: [
          //     InkWell(
          //       onTap: () {
          //         Navigator.pushNamed(context, Routes.spacificResult,
          //             arguments: ScreenArguments(
          //               title: LocaleKeys.labResult.tr(),
          //               image: ImageManager.blood,
          //             ));
          //       },
          //       child: BuildSingleCard(
          //         image: ImageManager.blood,
          //         text: LocaleKeys.labResult.tr(),
          //         notificationNumber: 3,
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         Navigator.pushNamed(context, Routes.readiologyScreen,
          //             arguments: ScreenArguments(
          //               title: LocaleKeys.radiologyResult.tr(),
          //               image: ImageManager.prescriptions,
          //             ));
          //       },
          //       child: BuildSingleCard(
          //         text: LocaleKeys.radiologyResult.tr(),
          //         image: ImageManager.radiology,
          //         notificationNumber: 3,
          //       ),
          //     ),
          //     InkWell(
          //       onTap: () {
          //         Navigator.pushNamed(context, Routes.spacificResult,
          //             arguments: ScreenArguments(
          //               title: LocaleKeys.prescritions.tr(),
          //               image: ImageManager.prescriptions,
          //             ));
          //       },
          //       child: BuildSingleCard(
          //         image: ImageManager.prescriptions,
          //         text: LocaleKeys.prescritions.tr(),
          //         notificationNumber: 3,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}

int responsiveGridViewCount(currentWidth) {
  if (currentWidth < 530) {
    debugPrint("$currentWidth return 3");
    return 1;
  } else if (currentWidth < 674) {
    debugPrint("$currentWidth return 2");
    return 2;
  } else {
    debugPrint("$currentWidth return 1");

    return 3;
  }
}

// double responsiveAspectRathio(currentWidth) {
//   if (currentWidth < 530) {
//     debugPrint("$currentWidth return 3");
//     return 1;
//   } else if (currentWidth < 674) {
//     debugPrint("$currentWidth return 2");
//     return 2;
//   } else {
//     debugPrint("$currentWidth return 1");

//     return 3;
//   }
// }
