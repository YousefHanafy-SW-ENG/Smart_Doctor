import 'package:doctor_final/core/uitls/app_strings.dart';
import 'package:doctor_final/features/home/presentation/widgets/my_app_bar.dart';
import 'package:doctor_final/features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_filtration_bar.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_overlay_widget.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_single_red_bar.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../login/presentation/widgets/back_ground.dart';

class PrescritionsResultScreen extends StatelessWidget {
  final String appBarTitle;
  final String appBarImage;
  const PrescritionsResultScreen({
    Key? key,
    required this.appBarTitle,
    required this.appBarImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowResultCubit, ShowResultState>(
      listener: (context, state) {},
      builder: (context, state) {
        final ShowResultCubit myCubit = ShowResultCubit().getCubit(context);
        return WillPopScope(
          onWillPop: () async {
            closeOverLay(context);
            return true;
          },
          child: Scaffold(
            appBar: myAppBar(
              backButton_onClick: () {
                
              },
              leadingWidth: 50,
              appTitle: BuildAppBarTitleWidget(
                image: appBarImage,
                text: appBarTitle,
              ),
              centerTitle: true,
              hasBackArrow: true,
              context: context,
            ),
            body: BackGround(
              isContainAppBar: true,
              screen: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    myCubit.closeAllImages();
                    closeOverLay(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        // filtiration bar
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BuildFiltrationBar2(
                            isVisitScreen: false,
                            firstFilter: AppStrings.date,
                            firstFilterPress: () async {
                              if (!myCubit.overLayWidgetIsOpen) {
                                try {
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.parse("2010-01-01"),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      myCubit.changeDateController(
                                        controllerName: myCubit.dateController,
                                        value: DateFormat('yyyy-MM-dd')
                                            .format(value),
                                      );
                                      // value: value.toString());
                                    }
                                  });
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              } else {
                                showToast(text: 'close the current widget');
                              }
                            },
                            secoundFilter: AppStrings.type,
                            secoundFilterPress: () {
                              if (!myCubit.overLayWidgetIsOpen) {
                                showTestTypeOverlay(
                                  context: context,
                                  items: [
                                    'Outpatient',
                                    'Inpatient',
                                    'Emergency',
                                  ],
                                  varName: myCubit.testTypeController,
                                );
                              } else {
                                showToast(text: 'close the current widget');
                              }
                            },
                            thirdFilter: AppStrings.testName,
                            thirdFilterPress: () {
                              if (!myCubit.overLayWidgetIsOpen) {
                                showTestNameOverlay(
                                  context: context,
                                  items: [
                                    'PCR',
                                    'CBC',
                                    'N++',
                                    'N--',
                                  ],
                                  varName: myCubit.testNameController,
                                );
                              } else {
                                showToast(text: 'close the current widget');
                              }
                            },
                          ),
                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return BuildSingleRedBar(
                              isVisitedScreen: false,
                              isRadiologyScreen: false,
                              showReportImage: false,
                              showReportImagePress: () {},
                              showPrescriptionImagePress: () {
                                myCubit.toggleLabImageVisibility(index: index);
                              },
                              showPrescriptionImage:
                                  myCubit.labImagesController[index],
                              leftText: myCubit.testTypeController,
                              rightText:
                                  myCubit.getCubit(context).testNameController,

                              // dateText: myCubit.dateController,
                              dateText: myCubit.labDummyData[index]['testDate'],

                              prescriptionImage: myCubit.labDummyData[index]
                                  ['prescriptionImage'],
                              reportImage: myCubit.labDummyData[index]
                                  ['reportImage'],

                              prescriptionIcon:
                                  myCubit.labEyeIconsController[index],
                              reportIcon: Icons.abc,
                              shareToPress: () {
                                myCubit.shareData();
                              },
                            );
                          },
                          itemCount: myCubit.labDummyData.length,
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
