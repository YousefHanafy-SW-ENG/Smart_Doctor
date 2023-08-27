import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/patient/patient_data.dart';
import 'package:doctor_final/shared/consts.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../circular_progess.dart';
import '../core/shared_wIdgets/app_text.dart';
import '../core/uitls/app_colors.dart';
import '../core/uitls/app_strings.dart';
import '../features/home/presentation/widgets/my_app_bar.dart';
import '../features/login/presentation/widgets/back_ground.dart';
import '../features/login/presentation/widgets/height_seperator.dart';
import '../features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import '../features/show_result/presentation/widgets/build_filtration_bar.dart';
import '../features/show_result/presentation/widgets/build_single_red_bar.dart';
import '../models/visits_model.dart';

class VisitsScreen1 extends StatefulWidget {
  const VisitsScreen1({Key? key}) : super(key: key);

  @override
  State<VisitsScreen1> createState() => _VisitsScreen1State();
}

class _VisitsScreen1State extends State<VisitsScreen1> {
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    _visit(context);
  }

  Future<void> _visit(BuildContext context) async {
    const String baseUrl = 'http://135.181.119.121:103';
    var myDio = Dio();
    try{
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
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => VisitsScreen1()),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PatientData()));
        },
        leadingWidth: 70,
        appTitle: BuildAppBarTitleWidget(
          image: ImageManager.accVisits,
          text: "" + LocaleKeys.visits,
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
                    padding: EdgeInsets.all(8),
                    child: BuildFiltrationBar3(
                      isVisitScreen: false,
                      firstFilter:Api_Date1?? AppStrings.date,
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
                                  colorScheme: ColorScheme.light(
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
                      secoundFilterPress: () async {},
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
                        getVisit.isNotEmpty?
                        ListView.builder(
                          itemCount: getVisit.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: BuildSingleVisitBar(
                                  name: getVisit[index].docname.toString(),
                                  date: DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(getVisit[index]
                                          .visitDate
                                          .toString())),
                                  Icon1: Icons.arrow_drop_up),
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
