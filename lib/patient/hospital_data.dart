import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/show_result/presentation/screens/radiology_result_screen.dart';
import 'package:doctor_final/features/show_result/presentation/screens/spacific_result_screen.dart';
import 'package:doctor_final/models/lab_result_model.dart';
import 'package:doctor_final/models/prescision_model.dart';
import 'package:doctor_final/models/radiology_result/radiology_result_model.dart';
import 'package:doctor_final/models/visits_model.dart';
import 'package:doctor_final/patient/visits.dart';
import 'package:doctor_final/prescrtion.dart';
import 'package:doctor_final/shared/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/uitls/constants.dart';
import '../core/uitls/image_manager.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/login/presentation/widgets/back_ground.dart';
import '../features/show_result/presentation/widgets/build_single_card.dart';
import '../translation/Local_Key.g.dart';

class HospitalData extends StatefulWidget {
  const HospitalData({Key? key}) : super(key: key);

  @override
  State<HospitalData> createState() => _HospitalDataState();
}

class _HospitalDataState extends State<HospitalData> {

  
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
    print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    getLabResult = [];
    if (response.statusCode == 200) {
      print('response.statusCode response.statusCode ${response.data}');
      print('Response is');
      print(response);
      LabResultModel labResultModel;

      setState(() {
        print('object');
        for (var i in response.data) {
          labResultModel = LabResultModel.fromJson(i);
          print('start');
          getLabResult.add(labResultModel);
          print('enddd');
        }
        print('AppConst().getLabResult : ${getLabResult}');
        print('AppConst().getLabResult[0] : ${getLabResult[0].name}');
        print('AppConst().getLabResult[0] : ${getLabResult[0].name}');
      });
      print('AppConst().getLabResult : ${getLabResult}');
      print('AppConst().getLabResult : ${getLabResult}');
      print("Done ya basha");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SpacificResultScreen()),
      );
    } else {
      // Handle login failure, show error message
    }
  }

  Future<void> _radiologyResult(BuildContext context) async {
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
    final response = await myDio.post(
      '$baseUrl/api/SmartPatientShowRadiologyResults',
      data: {
        "registerRequestID": null,
        "patientID": 2,
        "pserial": null,
        "visitID": null
      },
    );
    print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    getRadiologyResult = [];
    if (response.statusCode == 200) {
      print('response.statusCode response.statusCode ${response.data}');
      print('Response is');
      print(response);
      RadiologyModel radiologyModel;

      setState(() {
        print('object');
        for (var i in response.data) {
          radiologyModel = RadiologyModel.fromJson(i);
          print('start');
          getRadiologyResult.add(radiologyModel);
          print('enddd');
        }
        print('AppConst().getLabResult : ${getRadiologyResult}');
        print('AppConst().getLabResult[0] : ${getRadiologyResult[0].docname}');
        print(
            'AppConst().getLabResult[0] : ${getRadiologyResult[0].diagnosis}');
      });
      print('AppConst().getLabResult : ${getRadiologyResult}');
      print('AppConst().getLabResult : ${getRadiologyResult}');
      print("Done ya basha");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RadiologyResultScreen()),
      );
    } else {
      // Handle login failure, show error message
    }
  }

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
    getPrecision = [];
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
        print('AppConst().getLabResult : ${getPrecision}');
        print('AppConst().getLabResult[0] : ${getPrecision[0].docname}');
        print('AppConst().getLabResult[0] : ${getPrecision[0].direction}');
      });
      print('AppConst().getLabResult : ${getPrecision}');
      print('AppConst().getLabResult : ${getPrecision}');
      print("Done ya basha");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PrecisionScreen()),
      );
    } else {
      // Handle login failure, show error message
    }
  }

  Future<void> _visit(BuildContext context) async {
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
    final response = await myDio.post(
      '$baseUrl/api/SmartPatientSelectOutpatientVisits',
      data: {
        "pageNumber": 1,
        "rowsOfPage": 10,
        "sortingCol": null,
        "sortType": null,
        "registerRequestID": null,
        "patientID": 2,
        "docname": null,
        "doctorID": null,
        "visitDate": null,
        "datefrom": null,
        "dateto": null,
        "language": 2
      },
    );
    print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    getVisit = [];
    if (response.statusCode == 200) {
      print('response.statusCode response.statusCode ${response.data}');
      print('Response is');
      print(response);
      VisitModel visitModel;

      setState(() {
        print('object');
        for (var i in response.data) {
          visitModel = VisitModel.fromJson(i);
          print('start');
          getVisit.add(visitModel);
          print('enddd');
        }
        print('AppConst().getLabResult : ${getVisit}');
        print('AppConst().getLabResult[0] : ${getVisit[0].docname}');
        print('AppConst().getLabResult[0] : ${getVisit[0].doctorID}');
      });
      print('AppConst().getLabResult : ${getVisit}');
      print('AppConst().getLabResult : ${getVisit}');
      print("Done ya basha");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VisitsScreen1()),
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
                      builder: (context) =>  VisitsScreen1()),
                );
              },
              child: BuildSingleCard(
                image: ImageManager.accVisits,
                text: LocaleKeys.accVisits.tr(),
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
              onTap:
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RadiologyResultScreen()),
                );
              },
              child: BuildSingleCard(
                text: LocaleKeys.radiologyResult.tr(),
                image: ImageManager.radiology,
                notificationNumber: 2,
              ),
            ),
            InkWell(
              onTap:
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrecisionScreen()),
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
