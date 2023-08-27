// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';

import '../core/uitls/constants.dart';
import '../core/uitls/image_manager.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/login/presentation/widgets/back_ground.dart';
import '../features/show_result/presentation/screens/radiology_result_screen.dart';
import '../features/show_result/presentation/screens/spacific_result_screen.dart';
import '../features/show_result/presentation/widgets/build_single_card.dart';
import '../models/AccModel.dart';
import '../models/lab_result_model.dart';
import '../models/prescision_model.dart';
import '../models/radiology_result/radiology_result_model.dart';
import '../models/visits_model.dart';
import '../prescrtion.dart';
import '../shared/consts.dart';
import '../translation/Local_Key.g.dart';
import 'AccScreen.dart';

class HospitalData2 extends StatefulWidget {
  const HospitalData2({Key? key}) : super(key: key);

  @override
  State<HospitalData2> createState() => _HospitalData2State();
}

class _HospitalData2State extends State<HospitalData2> {






  Future<void> _labResult(BuildContext context) async {
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
    final response = await myDio.post(
      '$baseUrl/api/SmartPatientShowLabResults',
      data: {
        "registerRequestID": null,
        "patientID": 2,
        "pserial": null,
        "visitID": null,
      },
    );
    print('MMMMMMMMMMMMMMMMMMMMMMMMlabResultApiMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    getLabResult=[];
    if (response.statusCode == 200) {
      print('response.statusCode response.statusCode ${response.data}');
      print('Response is');
      print(response);
      LabResultModel labResultModel;

      setState(() {
        print('object');
        for (var i in response.data) {
          labResultModel = LabResultModel.fromJson(i);
          getLabResult.add(labResultModel);

        }
        print('AppConst().getLabResult : ${ getLabResult}');


      });

      print("Done ya basha");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   SpacificResultScreen()),
      );
    } else {
      // Handle login failure, show error message
    }
  }






  
  // Future<void> _radiologyResult(BuildContext context) async {
  //   const String baseUrl = 'http://135.181.119.121:103';
  //   var myDio = Dio();
  //   final response = await myDio.post(
  //     '$baseUrl/api/SmartPatientShowRadiologyResults',
  //     data: {
  //       "registerRequestID": null,
  //       "patientID": 2,
  //       "pserial": null,
  //       "visitID": null
  //     },
  //   );
  //   print('MMMMMMMMMMMMMMMMMMMMMMMMlabResultApiMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
  //   getRadiologyResult=[];
  //   if (response.statusCode == 200) {
  //     print('response.statusCode ${response.statusCode}');
  //     print('Response data is');
  //     print(response.data);
  //     RadiologyModel radiologyModel;

  //     setState(() {
  //       print('object');
  //       for (var i in response.data) {
  //         radiologyModel = RadiologyModel.fromJson(i);
  //         print('start');
  //         getRadiologyResult.add(radiologyModel);
  //         print('enddd');
  //       }
  //       print('AppConst().getLabResult : ${ getRadiologyResult}');


  //     });

  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //     builder: (context) => const RadiologyResultScreen()),
  //     // );
  //   } else {
  //     // Handle login failure, show error message
  //   }
  // }





  Future<void> _precisions(BuildContext context) async {
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>   PrecisionScreen()),
      );
    } else {
      // Handle login failure, show error message
    }
  }





  Future<void> _acc(BuildContext context) async {
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
    final response = await myDio.post(
      '$baseUrl/api/SmartPatientSelectInpatientStayPeriods',
      data: {
        "pageNumber": 1,
        "rowsOfPage": 10,
        "sortingCol": null,
        "sortType": null,
        "registerRequestID": null,
        "patID": 2,
        "docname": null,
        "doctorCode": null,
        "datefrom": null,
        "dateto": null
      },
    );
    print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    getAcc=[];
    if (response.statusCode == 200) {
      print('response.statusCode response.statusCode ${response.data}');
      print('Response is');
      print(response);
      AccModel accModel;

      setState(() {
        print('object');
        for (var i in response.data) {
          accModel = AccModel.fromJson(i);
          print('start');
          getAcc.add(accModel);
          print('enddd');
        }
        print('AppConst().getLabResult : ${ getAcc}');
        print('AppConst().getLabResult[0] : ${ getAcc[0].docname}');
        print('AppConst().getLabResult[0] : ${ getAcc[0].docname}');

      });
      print('AppConst().getLabResult : ${ getAcc}');
      print('AppConst().getLabResult : ${ getAcc}');
      print("Done ya basha");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  AccScreen()),
      );
    } else {
      // Handle login failure, show error message
    }
  }


  @override
  Widget build(BuildContext context) {
    final isSmallDisplay = MediaQuery.of(context).size.width < 600;

    return BackGround(
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
              onTap:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  AccScreen()),
                );
              },
              child: BuildSingleCard(
                image: ImageManager.accVisits,
                text: LocaleKeys.acc.tr(),
                notificationNumber: 0,
              ),
            ),
            InkWell(
              onTap:
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SpacificResultScreen()),
                );
              },
              child: BuildSingleCard(
                image: ImageManager.blood,
                text: LocaleKeys.labResult.tr(),
                notificationNumber: 3,
              ),
            ),

            InkWell(
              onTap:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RadiologyResultScreen()),
                  );
              },
              // () => _radiologyResult(context),
              child: BuildSingleCard(
                text: LocaleKeys.radiologyResult.tr(),
                image: ImageManager.radiology,
                notificationNumber: 2,
              ),
            ),
            InkWell(
              onTap:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  PrecisionScreen()),
                );
              },
              child: BuildSingleCard(
                image: ImageManager.prescriptions,
                text: LocaleKeys.prescritions.tr(),
                notificationNumber: 1,
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.pushNamed(context, Routes.spacificResult,
                //     arguments: ScreenArguments(
                //       title: LocaleKeys.prescritions.tr(),
                //       image: ImageManager.prescriptions,
                //     ));
              },
              child: BuildSingleCard(
                image: ImageManager.medicalRecord,
                text: LocaleKeys.medicalReport.tr(),
                notificationNumber: 0,
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.pushNamed(context, Routes.spacificResult,
                //     arguments: ScreenArguments(
                //       title: LocaleKeys.prescritions.tr(),
                //       image: ImageManager.prescriptions,
                //     ));
              },
              child: BuildSingleCard(
                image: ImageManager.otherServices,
                text: LocaleKeys.otherServices.tr(),
                notificationNumber: 1,
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
    );
  }
}