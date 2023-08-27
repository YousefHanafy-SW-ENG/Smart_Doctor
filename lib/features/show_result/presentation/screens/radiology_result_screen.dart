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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_final/patient/patient_data.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../circular_progess.dart';
import '../../../../core/shared_wIdgets/app_text.dart';
import '../../../../models/radiology_result/radiology_result_model.dart';
import '../../../../shared/consts.dart';
import '../../../login/presentation/widgets/back_ground.dart';

class RadiologyResultScreen extends StatefulWidget {
  const RadiologyResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RadiologyResultScreen> createState() => _RadiologyResultScreenState();
}


class _RadiologyResultScreenState extends State<RadiologyResultScreen> {
  
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    _radiologyResult(context);
  }



   Future<void> _radiologyResult(BuildContext context) async {

    setState(() {
      isLoading=true;
    });
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
    try{
      final response = await myDio.post(
      '$baseUrl/api/SmartPatientShowRadiologyResults',
      data: {
        "registerRequestID": null,
        "patientID": 2,
        "pserial": null,
        "visitID": null
      },
    );
    print('MMMMMMMMMMMMMMMMMMMMMMMMlabResultApiMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    getRadiologyResult=[];
    if (response.statusCode == 200) {
      print('response.statusCode ${response.statusCode}');
      print('Response data is');
      print(response.data);
      RadiologyModel radiologyModel;

      setState(() {
        print('object');
        for (var i in response.data) {
          radiologyModel = RadiologyModel.fromJson(i);
          print('start');
          getRadiologyResult.add(radiologyModel);
          print('enddd');
        }
        print('AppConst().getLabResult : ${ getRadiologyResult}');


      });

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const RadiologyResultScreen()),
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
              leadingWidth: 33,
              appTitle: BuildAppBarTitleWidget(
                image: ImageManager.radiology,
                text: AppStrings.radiologyResult,
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
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: BuildFiltrationBar1(
                            isVisitScreen: false,
                            firstFilter: AppStrings.date,
                            secoundFilter: AppStrings.type,
                            thirdFilter: AppStrings.testName,
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
                                          controllerName:
                                              myCubit.dateController,
                                          value: DateFormat('yyyy-MM-dd')
                                              .format(value)
                                              .toString());
                                    }
                                  });
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              } else {
                                showToast(text: 'close the current widget');
                              }
                            },
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
                            thirdFilterPress: () {
                              if (!myCubit.overLayWidgetIsOpen) {
                                showTestNameOverlay(
                                  context: context,
                                  items: [
                                    'CT Spines',
                                    'Ultra Sound',
                                    'Ultra ',
                                  ],
                                  varName: myCubit.testTypeController,
                                );
                              } else {
                                showToast(text: 'close the current widget');
                              }
                            },
                          ),
                        ),

                        //build list of red bars
                        getRadiologyResult.isNotEmpty
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
                              leftText: getRadiologyResult[index]
                                  .diagnosis
                                  .toString(),
                              rightText:
                                  getRadiologyResult[index].repType.toString(),

                              // dateText: myCubit.dateController,
                              dateText: DateFormat('dd-MM-yyyy').format(
                                  DateTime.parse(getRadiologyResult[index]
                                      .pdate
                                      .toString())),

                              prescriptionImage: ImageManager.radiology,
                              reportImage: ImageManager.radiology,

                              prescriptionIcon: Icons.remove_red_eye,
                              reportIcon: Icons.abc,
                              shareToPress: () {
                                myCubit.shareData();
                              },
                            );
                          },
                          itemCount: getRadiologyResult.length,
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
