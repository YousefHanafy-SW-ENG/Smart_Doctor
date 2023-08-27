// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';

import 'package:doctor_final/features/medical_report/presentation/screens/personal_info_screen.dart';
import 'package:doctor_final/models/inPatientModel.dart';
import 'package:doctor_final/patient/inPatient_screen.dart';
import 'package:doctor_final/patient/patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../../circular_progess.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/shared_wIdgets/app_text.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../../core/uitls/constants.dart';
import '../../../../core/uitls/image_manager.dart';
import '../../../../models/doctor_login__model/doctor_model.dart';
import '../../../../patient/CalendarScreen .dart';
import '../../../../patient/doctoProfile.dart';
import '../../../../patient/patient_model.dart';
import '../../../../patient/personal_data.dart';
import '../../../../shared/consts.dart';
import '../../../../translation/Local_Key.g.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../../../login/presentation/widgets/back_ground.dart';
import '../../../login/presentation/widgets/height_seperator.dart';
import '../../../show_result/presentation/screens/screen_arguments.dart';
import '../../../show_result/presentation/widgets/build_single_card.dart';
import '../widgets/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
bool is_Loading=false;


  Future Logout_Alert() {
    return showDialog(
        context: context,
        builder: (builder) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: AlertDialog(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Are You Sure to Logout ?",
                    style: TextStyle(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      SharedPreferences myPref =
                          await SharedPreferences.getInstance();
                      await myPref.remove('skip login');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      "Yes",
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancle"))
              ],
            ),
          );
        });
  }




//   Future<void> _patient(BuildContext context) async {
//     print('MMMMMMMMMMMMMMMMMMMMMMMM get_patient_data MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

//     setState(() {
//       is_Loading=true;
//     });
//     const String baseUrl = 'http://135.181.119.121:103';
//     var myDio = Dio();
//     final response = await myDio.post(
//       '$baseUrl/api/SmartDoctorShowOutPatients',
//       data: {
//         "registerRequestID": null,
//         "language": 2,
//         "doctorID": 174,
// //"roleID": 2,
//         "patientID": null,
//         "fullName": null,
//         "pageNumber": 1,
//         "rowsOfPage": 10,
//         "sortType": null,
//         "sortingCol": null,
//         "visitDate": null,
//         "dateFrom": null,
//         "dateTo": null
//       },
//     );
//     print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');
//     //final doctorCode = LoginModel.fromJson(response[0]['doctorcode']);
//     //final doctorName = LoginModel.fromJson(response[0]['doctorName']);
//     getPatient = [];
//     // Assuming your API returns an array with the doctor's information
//     if (response.statusCode == 200) {
//       // final doctorInfo = response[0];
//       //
//       // final SharedPreferences prefs = await SharedPreferences.getInstance();
//       // await prefs.setInt('doctorCode', doctorInfo['doctorcode']);
//       // await prefs.setString('doctorName', doctorInfo['doctorName']);
//       //final doctorCode = LoginModel.fromJson(response[0]['doctorcode']);
//       // final doctorName = LoginModel.fromJson(response[0]['doctorName']);

//       print('response.statusCode response.statusCode ${response.data}');
//       print('REsponse is');
//       print(response);
//       PatientModel patientModel;

//       setState(() {
//         for (var i in response.data) {
//           patientModel = PatientModel.fromJson(i);
//           // print(userModel.vactypeEname);
//           print('start');
//           getPatient.add(patientModel);
//           print('enddd');
//         }
//         print('AppConst().getPatient : ${getPatient}');
//         print('AppConst().getPatient[0] : ${getPatient[0].patientID}');
//         print('AppConst().getPatient[0] : ${getPatient[0].fullName}');

//         //String shard  =  getLoginDoctor[0].doctorName;
//       });
//       print('AppConst().getPatient : ${getPatient}');
//       print('AppConst().getPatient : ${getPatient}');
//       print("Done ya basha");
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => PatientScreen()),
//       );
//     } else {
//       // Handle login failure, show error message
//     }

//     setState(() {
//       is_Loading=false;
//     });
//   }


  @override
  Widget build(BuildContext context) {
    // PatientModel patient;
    // final loginModel = Provider.of<LoginModel>(context);
    final isSmallDisplay = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      appBar: !AppConstants.weRunOnWeb
          ? myAppBar(
            backButton_onClick: () {
              
            },
              centerTitle: true,
              context: context,
              hasBackArrow: false,
              appTitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Text(
                    LocaleKeys.home.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          : null,
      body:is_Loading == true? 
        My_circular_progress()
        : 
        SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(children: [
            if (AppConstants.weRunOnWeb)
              Container(
                height: 7.h,
                width: 25.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.lightGery,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                    Text(
                      LocaleKeys.home.tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    Image.asset(ImageManager.hospital),
                  ],
                ),
              ),

            Row(
              children: [
                Card(
                  elevation: 5,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 8.w,
                    backgroundColor: AppColors.white,
                    child: Image.asset(
                      'assets/images/vector.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: context.width * 0.05,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppText(
                        'Hi, ${getLoginDoctor[0].doctorName}',
                        textColor: AppColors.primaryColor,
                        align: TextAlign.start,
                      ),
                      AppText(
                        // LocaleKeys.welcomeToHos.tr(),
                        'ID Number : ${getLoginDoctor[0].doctorCode}',
                        textColor: Colors.grey,
                        fontSize: 9,
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                // IconButton(
                //   onPressed: () {
                //     Navigator.pushNamed(
                //       context,
                //       Routes.testScreen,
                //     );
                //   },
                //   icon: Icon(
                //     Icons.person_search,
                //     color: AppConstants.isCurrentThemeDark
                //         ? AppColors.white
                //         : AppColors.darkBlack,
                //   ),
                // ),
                // IconButton(
                //   onPressed: () {
                //     HomeCubit().getCubit(context).changeTheme();
                //   },
                //   icon: Icon(
                //     Icons.dark_mode,
                //     color: AppConstants.isCurrentThemeDark
                //         ? AppColors.white
                //         : AppColors.darkBlack,
                //   ),
                // ),
              ],
            ),
            HeightSeperator(height: 5.h),
            BackGround(
              isContainAppBar: true,
              screen: Padding(
                padding: const EdgeInsets.all(0.0),
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
                  //mainAxisSpacing: context.height * 0,
                  crossAxisSpacing: context.width * 0.09,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientScreen()),
                        );
                      },
                      child: BuildSingleCard1(
                        image: ImageManager.myPatients,
                        text: LocaleKeys.myPatients.tr(),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => inPatientScreen()),
                        );
                      },
                      child: BuildSingleCard1(
                        text: LocaleKeys.inPatients.tr(),
                        image: ImageManager.inPatients,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalendarScreen()),
                        );
                      },
                      child: BuildSingleCard1(
                        image: ImageManager.myAppointments,
                        text: LocaleKeys.myAppointments.tr(),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => doctorProfile(),
                          ));
                      },
                      child: BuildSingleCard1(
                        image: ImageManager.myProfile,
                        text: LocaleKeys.myProfile.tr(),
                        
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
            // * personal info
            // InkWell(
            //   child: BuildCard(
            //     showNotificationCircule: false,
            //     icon: ImageManager.medicalReport,
            //     text: LocaleKeys.personalData.tr(),
            //   ),
            //   onTap: () {
            //     // closeVisitsOrResultOverlay(context);
            //     Navigator.pushNamed(
            //       context,
            //       Routes.medicalScreen,
            //       arguments: {
            //         'appTitle': LocaleKeys.personalData.tr(),
            //       },
            //     );
            //   },
            // ),
            // HeightSeperator(height: 2.h),
            // // * Booking
            // InkWell(
            //   child: BuildCard(
            //     showNotificationCircule: false,
            //     icon: 'assets/images/booking.png',
            //     text: LocaleKeys.booking.tr(),
            //   ),
            //   onTap: () {},
            // ),
            // HeightSeperator(height: 2.h),
            // * invoices

            // InkWell(
            //   child: BuildCard(
            //     showNotificationCircule: true,
            //     icon: ImageManager.showRes,
            //     text: LocaleKeys.showResults.tr(),
            //   ),
            //   onTap: () {
            //     showDialog(
            //         context: context,
            //         builder: (context) {
            //           return Dialog(
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(30.0),
            //             ),
            //             child: const _VisitOrResultDialog(),
            //           );
            //         });
            //   },
            // ),
            // HeightSeperator(height: 2.h),
            // InkWell(
            //   child: BuildCard(
            //     showNotificationCircule: false,
            //     icon: 'assets/images/invoice.png',
            //     text: LocaleKeys.invoices.tr(),
            //   ),
            //   onTap: () {
            //     // closeVisitsOrResultOverlay(context);
            //     // Navigator.pushNamed(
            //     //   context,
            //     //   Routes.medicalScreen,
            //     //   arguments: {
            //     //     'appTitle': LocaleKeys.personalData.tr(),
            //     //   },
            //     // );
            //   },
            // ),
            // HeightSeperator(height: 2.h),
            //
            // InkWell(
            //   child: BuildCard(
            //     showNotificationCircule: true,
            //     icon: 'assets/images/survey.png',
            //     text: LocaleKeys.survey.tr(),
            //     number: 3,
            //   ),
            //   onTap: () {
            //     // closeVisitsOrResultOverlay(context);
            //     // Navigator.pushNamed(
            //     //   context,
            //     //   Routes.medicalScreen,
            //     //   arguments: {
            //     //     'appTitle': LocaleKeys.personalData.tr(),
            //     //   },
            //     // );
            //   },
            // ),
            // HeightSeperator(height: 2.h),
            //
            // InkWell(
            //   child: BuildCard(
            //     showNotificationCircule: false,
            //     icon: 'assets/images/complaint.png',
            //     text: LocaleKeys.complaint.tr(),
            //     textSize: 15,
            //   ),
            //   onTap: () {
            //     // closeVisitsOrResultOverlay(context);
            //     // Navigator.pushNamed(
            //     //   context,
            //     //   Routes.medicalScreen,
            //     //   arguments: {
            //     //     'appTitle': LocaleKeys.personalData.tr(),
            //     //   },
            //     // );
            //   },
            // ),
            // HeightSeperator(height: 2.h),
            // InkWell(
            //   child: BuildCard(
            //     showNotificationCircule: false,
            //     icon: ImageManager.logOut,
            //     text: LocaleKeys.logOut.tr(),
            //   ),
            //   onTap: () {
            //     // closeVisitsOrResultOverlay(context);
            //
            //     SignupCubit.getCubit(context).clearAllControllers();
            //     AppNavigation.pushAndDelete(
            //         route: Routes.loginScreen, context: context);
            //   },
            // ),

            // Text('Doctor Code: ${loginModel.doctorcode}'),
            // Text('Doctor Name: ${loginModel.doctorName}'), ],
            GestureDetector(
                    onTap: () async {
                      await Logout_Alert();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [AppText("Logout"), Icon(Icons.logout)],
                    ),
                  )
          ]),
        ),
      ),
    );
  }
}

class _VisitOrResultDialog extends StatelessWidget {
  const _VisitOrResultDialog();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.visits.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: const Divider(
              color: AppColors.black,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.result.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
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
