import 'package:dio/dio.dart';
import 'package:doctor_final/core/uitls/app_strings.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/features/home/presentation/widgets/my_app_bar.dart';
import 'package:doctor_final/features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_filtration_bar.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_overlay_widget.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/build_single_red_bar.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/show_toast.dart';
import 'package:doctor_final/shared/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'circular_progess.dart';
import 'core/shared_wIdgets/app_text.dart';
import 'features/login/presentation/widgets/back_ground.dart';
import 'models/prescision_model.dart';

class PrecisionScreen extends StatefulWidget {
  final String appBarTitle;
  final String appBarImage;
  PrecisionScreen({
    Key? key,
    this.appBarTitle = '',
    this.appBarImage = '',
  }) : super(key: key);

  @override
  State<PrecisionScreen> createState() => _PrecisionScreenState();
}

class _PrecisionScreenState extends State<PrecisionScreen> {
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    _precisions(context);
  }
  Future<void> _precisions(BuildContext context) async {
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
    try{
    final response = await myDio.post(
      '$baseUrl/api/SmartPatientShowMedicationsResults',
      data: {
        "mrn": 2,
        "pserial": null,
        "visitId": null,
        "registerRequestId": null
      },
    );
    print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    getPrecision=[];
    if (response.statusCode == 200) {
      print('response.statusCode response.statusCode ${response.data}');
      print('Response is');
      print(response);
      PrecisionModel precisionModel;

      setState(() {
        print('object');
        for (var i in response.data) {
          precisionModel = PrecisionModel.fromJson(i);
          print('start');
          getPrecision.add(precisionModel);
          print('enddd');
        }
        print('AppConst().getLabResult : ${ getPrecision}');
        print('AppConst().getLabResult[0] : ${ getPrecision[0].docname}');
        print('AppConst().getLabResult[0] : ${ getPrecision[0].direction}');

      });
      print('AppConst().getLabResult : ${ getPrecision}');
      print('AppConst().getLabResult : ${ getPrecision}');
      print("Done ya basha");
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) =>   PrecisionScreen()),
      // );
    } else {
      // Handle login failure, show error message
    }
    setState(() {
      isLoading=false;
    });
    }catch(error){
      setState(() {
        isLoading=false;
      });
      //Navigator.pop(context);
      print("erorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    }

  }

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
                Navigator.pop(context);
              },
              leadingWidth: 50,
              appTitle: BuildAppBarTitleWidget(
                image: ImageManager.prescriptions,
                text: AppStrings.prescritions,
              ),
              centerTitle: true,
              hasBackArrow: true,
              context: context,
            ),
            body: isLoading == true?
            const My_circular_progress()
            :
            BackGround(
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
                          child: BuildFiltrationBar1(
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
                        getPrecision.isNotEmpty
                        ?ListView.builder(
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
                                showImage = !showImage;
                              },
                              showPrescriptionImage: showImage,
                              leftText: getPrecision[index].unit.toString(),
                              rightText: getPrecision[index].docname.toString(),

                              // dateText: myCubit.dateController,
                              dateText: DateFormat('dd-MM-yyyy').format(
                                  DateTime.parse(getPrecision[index]
                                      .startingFrom
                                      .toString())),

                              prescriptionImage: ImageManager.prescriptions,
                              reportImage: ImageManager.prescriptions,

                              prescriptionIcon: Icons.remove_red_eye,
                              reportIcon: Icons.abc,
                              shareToPress: () {
                                myCubit.shareData();
                              },
                            );
                          },
                          itemCount: getLabResult.length,
                        )
                            :Column(
                          children: [
                            SizedBox(height: 3.h,),
                            Center(
                              child: AppText("No Data Found !"),
                            ),
                          ],
                        )
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
