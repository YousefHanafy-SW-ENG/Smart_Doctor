// import 'package:dio/dio.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:doctor_final/core/uitls/app_colors.dart';
// import 'package:doctor_final/core/uitls/image_manager.dart';
// import 'package:doctor_final/features/home/presentation/widgets/my_app_bar.dart';
// import 'package:doctor_final/features/login/presentation/widgets/back_ground.dart';
// import 'package:doctor_final/features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
// import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
// import 'package:doctor_final/features/show_result/presentation/widgets/build_filtration_bar.dart';
// import 'package:doctor_final/features/show_result/presentation/widgets/build_single_red_bar.dart';
// import 'package:doctor_final/features/show_result/presentation/widgets/show_toast.dart';
// import 'package:doctor_final/features/visitScreen/presentation/cubit/visit_screen_cubit.dart';
// import 'package:doctor_final/features/visitScreen/presentation/widgets/show_type_overlay_visits_screen.dart';
// import 'package:doctor_final/patient/patient_data.dart';
// import 'package:doctor_final/translation/Local_Key.g.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../models/visits_model.dart';
// import '../../../../shared/consts.dart';
//
// class VisitsScreen extends StatefulWidget {
//   const VisitsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<VisitsScreen> createState() => _VisitsScreenState();
// }
//
// class _VisitsScreenState extends State<VisitsScreen> {
//   bool isLoading=false;
//
//   @override
//   void initState() {
//     super.initState();
//     _visit(context);
//   }
// }
//
//   Future<void> _visit(BuildContext context) async {
//     const String baseUrl = 'http://135.181.119.121:103';
//     var myDio = Dio();
//     final response = await myDio.post(
//       '$baseUrl/api/SmartPatientSelectOutpatientVisits',
//       data: {
//         "pageNumber": 1,
//         "rowsOfPage": 10,
//         "sortingCol": null,
//         "sortType": null,
//         "registerRequestID": null,
//         "patientID": 2,
//         "docname": null,
//         "doctorID": null,
//         "visitDate": null,
//         "datefrom": null,
//         "dateto": null,
//         "language": 2
//       },
//     );
//     print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
//     getVisit = [];
//     if (response.statusCode == 200) {
//       print('response.statusCode response.statusCode ${response.data}');
//       print('Response is');
//       print(response);
//       VisitModel visitModel;
//
//       setState(() {
//         print('object');
//         for (var i in response.data) {
//           visitModel = VisitModel.fromJson(i);
//           print('start');
//           getVisit.add(visitModel);
//           print('enddd');
//         }
//         print('AppConst().getLabResult : ${getVisit}');
//         print('AppConst().getLabResult[0] : ${getVisit[0].docname}');
//         print('AppConst().getLabResult[0] : ${getVisit[0].doctorID}');
//       });
//       print('AppConst().getLabResult : ${getVisit}');
//       print('AppConst().getLabResult : ${getVisit}');
//       print("Done ya basha");
//     } else {
//       // Handle login failure, show error message
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShowResultCubit, ShowResultState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         VisitScreenCubit myCubit = VisitScreenCubit().getCubit(context);
//         return Scaffold(
//           appBar: myAppBar(
//             backButton_onClick: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PatientData()
//               ));
//         },
//             appTitle: BuildAppBarTitleWidget(
//               image: ImageManager.calender.tr(),
//               text: LocaleKeys.visits.tr(),
//             ),
//             centerTitle: true,
//             hasBackArrow: true,
//             context: context,
//           ),
//           body: InkWell(
//             onTap: () {
//               closeShowTypeOverLay(context);
//             },
//             child: BackGround(
//               screen: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: BuildFiltrationBar(
//                         isVisitScreen: true,
//                         firstFilter: LocaleKeys.date.tr(),
//                         secoundFilter: LocaleKeys.type.tr(),
//                         thirdFilter: '',
//                         firstFilterPress: () async {
//                           if (!myCubit.overLayWidgetIsOpen) {
//                             try {
//                               await showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime.now(),
//                                 lastDate: DateTime.parse("2023-08-07"),
//                               ).then((value) {
//                                 if (value != null) {
//                                   myCubit.changeDateController(
//                                       value: DateFormat('yyyy-MM-dd')
//                                           .format(value)
//                                           .toString());
//                                 }
//                               });
//                             } catch (e) {
//                               debugPrint(e.toString());
//                             }
//                           } else {
//                             showToast(text: "please close other widgets");
//                           }
//                         },
//                         secoundFilterPress: () {
//                           if (!myCubit.overLayWidgetIsOpen) {
//                             showTypeOverlayVisitsScreen(
//                               context: context,
//                               items: [
//                                 'Outpatient',
//                                 'Inpatient',
//                                 'Emergency',
//                               ],
//                               varName: myCubit.typeController,
//                             );
//                           } else {
//                             showToast(text: "please close other widgets");
//                           }
//                         },
//                         thirdFilterPress: () {},
//                       ),
//                     ),
//
//                     //first expanssion tiles
//
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Card(
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         clipBehavior: Clip.antiAlias,
//                         child: ExpansionTile(
//                           collapsedBackgroundColor: AppColors.hintColor,
//                           iconColor: AppColors.white,
//                           collapsedIconColor: AppColors.white,
//                           backgroundColor: AppColors.hintColor,
//                           title: Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   "${LocaleKeys.visitNumber.tr()} 1",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .copyWith(
//                                         fontSize: 15,
//                                       ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   myCubit.dateController[0],
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .copyWith(
//                                         fontSize: 15,
//                                       ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           children: [
//                             Container(
//                               color: AppColors.white,
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return BuildSingleRedBar(
//                                     isVisitedScreen: true,
//                                     isRadiologyScreen: true,
//                                     showReportImagePress: () {
//                                       ShowResultCubit()
//                                           .getCubit(context)
//                                           .toggleReportImageVisibility(
//                                               index: index);
//                                     },
//                                     showPrescriptionImagePress: () {
//                                       ShowResultCubit()
//                                           .getCubit(context)
//                                           .togglePrescriptionImageVisibility(
//                                               index: index);
//                                     },
//                                     showPrescriptionImage: ShowResultCubit()
//                                         .getCubit(context)
//                                         .prescriptionsImagesController[index],
//                                     leftText: ShowResultCubit()
//                                         .getCubit(context)
//                                         .radiologyDummyData[index]['testType'],
//                                     rightText: ShowResultCubit()
//                                         .getCubit(context)
//                                         .radiologyDummyData[index]['testName'],
//
//                                     // dateText: myCubit.dateController,
//                                     dateText: ShowResultCubit()
//                                         .getCubit(context)
//                                         .radiologyDummyData[index]['testDate'],
//                                     prescriptionImage: ShowResultCubit()
//                                             .getCubit(context)
//                                             .radiologyDummyData[index]
//                                         ['prescriptionImage'],
//                                     reportImage: ShowResultCubit()
//                                             .getCubit(context)
//                                             .radiologyDummyData[index]
//                                         ['reportImage'],
//                                     prescriptionIcon: ShowResultCubit()
//                                         .getCubit(context)
//                                         .prescriptionEyeIconsController[index],
//                                     reportIcon: ShowResultCubit()
//                                         .getCubit(context)
//                                         .reportEyeIconsController[index],
//                                     showReportImage: ShowResultCubit()
//                                         .getCubit(context)
//                                         .reportsImagesController[index],
//
//                                     shareToPress: () {},
//                                   );
//                                 },
//                                 itemCount: ShowResultCubit()
//                                     .getCubit(context)
//                                     .radiologyDummyData
//                                     .length,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     /**
//                      secound expanssion tile
//                      */
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Card(
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         clipBehavior: Clip.antiAlias,
//                         child: ExpansionTile(
//                           collapsedBackgroundColor: AppColors.hintColor,
//                           iconColor: AppColors.white,
//                           collapsedIconColor: AppColors.white,
//                           backgroundColor: AppColors.hintColor,
//                           title: Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   "${LocaleKeys.visitNumber.tr()} 2",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .copyWith(
//                                         fontSize: 15,
//                                       ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   myCubit.dateController[1],
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .copyWith(
//                                         fontSize: 15,
//                                       ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           children: [
//                             Container(
//                               color: AppColors.white,
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return BuildSingleRedBar(
//                                     isVisitedScreen: true,
//                                     isRadiologyScreen: false,
//                                     showReportImage: false,
//                                     showReportImagePress: () {},
//                                     showPrescriptionImagePress: () {
//                                       ShowResultCubit()
//                                           .getCubit(context)
//                                           .toggleLabImageVisibility(
//                                               index: index);
//                                     },
//                                     showPrescriptionImage: ShowResultCubit()
//                                         .getCubit(context)
//                                         .labImagesController[index],
//                                     leftText: ShowResultCubit()
//                                         .getCubit(context)
//                                         .testTypeController,
//                                     rightText: ShowResultCubit()
//                                         .getCubit(context)
//                                         .getCubit(context)
//                                         .testNameController,
//
//                                     // dateText: ShowResultCubit().getCubit(context).dateController,
//                                     dateText: ShowResultCubit()
//                                         .getCubit(context)
//                                         .dateController,
//
//                                     prescriptionImage: ShowResultCubit()
//                                             .getCubit(context)
//                                             .labDummyData[index]
//                                         ['prescriptionImage'],
//                                     reportImage: ShowResultCubit()
//                                         .getCubit(context)
//                                         .labDummyData[index]['reportImage'],
//
//                                     prescriptionIcon: ShowResultCubit()
//                                         .getCubit(context)
//                                         .labEyeIconsController[index],
//                                     reportIcon: Icons.abc,
//                                     shareToPress: () {},
//                                   );
//                                 },
//                                 itemCount: ShowResultCubit()
//                                     .getCubit(context)
//                                     .labDummyData
//                                     .length,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// /**
//
//
//
//  */
//
// /*
//
//
//
//
//
// */
