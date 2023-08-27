import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_final/patient/InPatient_data.dart';
import 'package:sizer/sizer.dart';
import '../circular_progess.dart';
import '../core/shared_wIdgets/app_text.dart';
import '../core/uitls/app_colors.dart';
import '../core/uitls/app_strings.dart';
import '../core/uitls/image_manager.dart';
import '../features/home/presentation/widgets/my_app_bar.dart';
import '../features/login/presentation/widgets/back_ground.dart';
import '../features/login/presentation/widgets/height_seperator.dart';
import '../features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import '../features/show_result/presentation/widgets/build_filtration_bar.dart';
import '../features/show_result/presentation/widgets/build_single_red_bar.dart';
import '../models/AccModel.dart';
import '../shared/consts.dart';
import '../translation/Local_Key.g.dart';

class AccScreen extends StatefulWidget {
  const AccScreen({Key? key}) : super(key: key);

  @override
  State<AccScreen> createState() => _AccScreenState();
}

class _AccScreenState extends State<AccScreen> {
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    _acc(context);
  }

  Future<void> _acc(BuildContext context) async {
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
    try{
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


  bool is_Loading = false;
  String day1 = '';
  String month1 = '';
  String year1 = '';
  DateTime? myDate1;
  String? Api_Date1_visit;
  String? Api_Date1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        backButton_onClick: () {
          is_Loading==false;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InpatientData()
              ));
        },
        leadingWidth:72,
        appTitle: BuildAppBarTitleWidget(
          image: ImageManager.accVisits,
          text: ""+LocaleKeys.acc,
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
              //myCubit.closeAllImages();
              // closeOverLay(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BuildFiltrationBar3(
                      isVisitScreen: false,
                      firstFilter: AppStrings.date,
                      secoundFilter: AppStrings.type,
                      thirdFilter: AppStrings.testName,
                      firstFilterPress: () async {
                        myDate1 = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2009),
                          lastDate: DateTime(2024),
                          builder: (context, childd) {
                            return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Color.fromARGB(255, 143, 160, 255),
                                    onPrimary: AppColors.white,
                                    secondary:
                                        Color.fromARGB(255, 143, 160, 255),
                                  ),
                                ),
                                child: childd!);
                          },
                        );

                        if (myDate1 == null) {
                        } else {
                          if (myDate1!.month.toString().length < 2) {
                            month1 = "0${myDate1!.month}";
                          } else {
                            month1 = myDate1!.month.toString();
                          }
                          if (myDate1!.day.toString().length < 2) {
                            day1 = "0${myDate1!.day}";
                          } else {
                            day1 = myDate1!.day.toString();
                          }
                          if (myDate1!.year.toString().length < 2) {
                            year1 = "0${myDate1!.year}";
                          } else {
                            year1 = myDate1!.year.toString();
                          }
                          setState(() {
                            Api_Date1_visit = "${year1}-${month1}-${day1}";
                          });
                          
                        }
                        // print(Api_Date1);
                      },
                      secoundFilterPress: () {
                        //   if (!myCubit.overLayWidgetIsOpen) {
                        //     showTestTypeOverlay(
                        //       context: context,
                        //       items: [
                        //         'Outpatient',
                        //         'Inpatient',
                        //         'Emergency',
                        //       ],
                        //       varName: myCubit.testTypeController,
                        //     );
                        //   } else {
                        //     showToast(text: 'close the current widget');
                        //   }
                      },
                      thirdFilterPress: () {
                        //   if (!myCubit.overLayWidgetIsOpen) {
                        //     showTestNameOverlay(
                        //       context: context,
                        //       items: [
                        //         'CT Spines',
                        //         'Ultra Sound',
                        //         'Ultra ',
                        //       ],
                        //       varName: myCubit.testTypeController,
                        //     );
                        //   } else {
                        //     showToast(text: 'close the current widget');
                        //   }
                      },
                    ),
                  ),
                  HeightSeperator(height: 1.5.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        getAcc.isNotEmpty?
                        ListView.builder(
                          itemCount:getAcc.length ,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top:5 ),
                              child:  BuildSingleAccBar(
                                  name:getAcc[index].docname.toString() ,
                                  date: DateFormat('dd-MM-yyyy').format(DateTime.parse(getAcc[index].indate.toString())),
                                  Icon1: Icons.arrow_drop_up
                              ),
                            );

                          },
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
                  //build list of red bars
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}