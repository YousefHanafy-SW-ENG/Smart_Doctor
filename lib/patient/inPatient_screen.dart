// ignore_for_file: prefer_const_constructors, empty_catches

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_final/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_final/patient/reusablesWidgets/ErrorMessage.dart';
import 'package:sizer/sizer.dart';

import '../circular_progess.dart';
import '../core/shared_wIdgets/app_text.dart';
import '../core/shared_wIdgets/search_textfild/search.dart';
import '../core/uitls/app_colors.dart';
import '../core/uitls/app_strings.dart';
import '../core/uitls/constants.dart';
import '../core/uitls/image_manager.dart';
import '../features/home/presentation/widgets/my_app_bar.dart';
import '../features/login/presentation/widgets/height_seperator.dart';
import '../features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import '../features/show_result/presentation/widgets/build_filtration_bar.dart';
import '../features/show_result/presentation/widgets/build_single_red_bar.dart';
import '../models/inPatientModel.dart';
import '../shared/consts.dart';
import '../translation/Local_Key.g.dart';

class inPatientScreen extends StatefulWidget {
  const inPatientScreen({Key? key}) : super(key: key);

  @override
  State<inPatientScreen> createState() => _inPatientScreenState();
}

class _inPatientScreenState extends State<inPatientScreen> {
  bool is_Loading = false;
  String day1 = '';
  String month1 = '';
  String year1 = '';
  DateTime? myDate1;
  String? Api_Date1;

  String day2 = '';
  String month2 = '';
  String year2 = '';
  DateTime? myDate2;
  String? Api_Date2;
  TextEditingController searchNameController = TextEditingController();
  TextEditingController searchIdController = TextEditingController();

  String sortString = "A:Z";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_in_patient_data(context);
  }

  dynamic get_in_patient_data(BuildContext context) async {
    setState(() {
      is_Loading = true;
    });

    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api get_in_patient_data MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    const String baseUrl = 'http://135.181.119.121:103';

    var myDio = Dio();

    try {
      final response = await myDio.post(
        '$baseUrl/api/SmartDoctorShowInPatients',
        data: {
          "registerRequestID": null,
          "language": 2,
          "doctorCode": 16,
          //getLoginDoctor[0].doctorCode,
          // 174,
          //getLoginDoctor[0].doctorCode,
          //"roleID": 2,
          "patientID": searchIdController.text == ""
              ? null
              : searchIdController.text.toString(),

          "fullName": searchNameController.text == ""
              ? null
              : searchNameController.text.toString(),
          "pageNumber": 1,
          "rowsOfPage": 10,
          "sortType": null,
          "sortingCol": null,
          "dateFrom": Api_Date1,
          "dateTo": Api_Date2
        },
      );

      print(
          'MMMMMMMMMMMMMMMMMMMMMMMM Api get_in_patient_data good MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
      print(
          'response.statusCode response.statusCode ${response.statusCode.toString()}\n\n');
      print('response.statusCode response ${response.data.toString()}');

      if (response.statusCode == 200) {
        getInPatient = [];
        Recieve_InPatient_Model recieve_inPatient_Model;

        setState(() {
          for (var i in response.data) {
            recieve_inPatient_Model = Recieve_InPatient_Model.fromJson(i);
            getInPatient.add(recieve_inPatient_Model);
          }
        });
      } else {
        // Handle login failure, show error message
        print(
            'MMMMMMMMMMMMMMMMMMMMMMMM Api get_in_patient_data error MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
      }
      setState(() {
        is_Loading = false;
      });

      print(
          'MMMMMMMMMMMMMMMMMMMMMMMM Api get_in_patient_data MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    } catch (error) {
      setState(() {
        is_Loading = false;
      });
      print("********get_in_patient_response error***********");
      print("Error Details:${error.toString()}");
      print("********get_in_patient_response error***********");
      Error_Message(
          Get_context: context,
          Error_Message: "Error Details:${error.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    //final isSmallDisplay = MediaQuery.of(context).size.width < 600;

    dynamic POPUB() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              content: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(child: AppText("Enter ID")),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 186, 186, 186),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        offset: Offset(1, 1),
                                        blurRadius: 10,
                                        spreadRadius: 1),
                                  ]),
                              child: M_Textform(
                                  borderRadius: 8,
                                  fieldColor: Colors.white,
                                  hintText: "Search",
                                  onFocous_border_color: Colors.blue,
                                  fieldType: TextInputType.number,
                                  textForm_Controller: searchIdController),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(255, 171, 170, 170),
                          )),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(255, 171, 170, 170),
                          )),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    }

    dynamic Second_Copy_dialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              content: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Date From",
                            style: TextStyle(
                                color: Color.fromARGB(215, 71, 153, 189),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: InkWell(
                              splashColor: AppColors.babyBlue,
                              borderRadius: BorderRadius.circular(10),
                              onTap: () async {
                                myDate1 = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2009),
                                  lastDate: DateTime(2024),
                                  builder: (context, childd) {
                                    return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: Color.fromARGB(
                                                255, 143, 160, 255),
                                            onPrimary: AppColors.white,
                                            secondary: Color.fromARGB(
                                                255, 143, 160, 255),
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
                                    Api_Date1 = "${year1}-${month1}-${day1}";
                                  });
                                  Navigator.pop(context);
                                  Second_Copy_dialog();
                                }
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.white,
                                    border: Border.all(
                                      color: Colors
                                          .grey, // Set the border color here
                                      width: 1,
                                    )),
                                child: Text(
                                  Api_Date1 ?? "Date",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(215, 71, 153, 189),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Date To",
                              style: TextStyle(
                                  color: Color.fromARGB(215, 71, 153, 189),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: InkWell(
                                splashColor: AppColors.babyBlue,
                                borderRadius: BorderRadius.circular(10),
                                onTap: () async {
                                  myDate2 = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2009),
                                    firstDate: DateTime(2009),
                                    lastDate: DateTime(2023),
                                    builder: (context, childdd) {
                                      return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: Color.fromARGB(
                                                  255, 143, 160, 255),
                                              onPrimary: AppColors.white,
                                              secondary: Color.fromARGB(
                                                  255, 143, 160, 255),
                                            ),
                                          ),
                                          child: childdd!);
                                    },
                                  );

                                  if (myDate2 == null) {
                                  } else {
                                    if (myDate2!.month.toString().length < 2) {
                                      month2 = "0${myDate2!.month}";
                                    } else {
                                      month2 = myDate2!.month.toString();
                                    }
                                    if (myDate2!.day.toString().length < 2) {
                                      day2 = "0${myDate2!.day}";
                                    } else {
                                      day2 = myDate2!.day.toString();
                                    }
                                    if (myDate2!.year.toString().length < 2) {
                                      year1 = "0${myDate2!.year}";
                                    } else {
                                      year2 = myDate2!.year.toString();
                                    }
                                    setState(() {
                                      Api_Date2 = "${year2}-${month2}-${day2}";
                                    });

                                    Navigator.pop(context);
                                    Second_Copy_dialog();
                                  }
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.white,
                                      border: Border.all(
                                        color: Colors
                                            .grey, // Set the border color here
                                        width: 1,
                                      )),
                                  child: Text(
                                    Api_Date2 ?? "Date",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: Color.fromARGB(215, 71, 153, 189),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(255, 171, 170, 170),
                          )),
                          child: TextButton(
                            onPressed: () {
                              //print(Api_Date1);
                              // Api_Date2 = null;
                              // Api_Date1 = null;
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(255, 171, 170, 170),
                          )),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              Api_Date2 = null;
                              Api_Date1 = null;
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: myAppBar(
        backButton_onClick: () {
          //is_Loading = false;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        leadingWidth: 7.h,
        appTitle: BuildAppBarTitleWidget(
          image: ImageManager.inPatients,
          text: LocaleKeys.inPatients.tr(),
        ),
        centerTitle: true,
        hasBackArrow: true,
        context: context,
      ),
      body: is_Loading == true
          ? My_circular_progress()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  children: [
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
                    HeightSeperator(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 186, 186, 186),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      offset: Offset(1, 1),
                                      blurRadius: 10,
                                      spreadRadius: 1),
                                ]),
                            child: M_Textform(
                                borderRadius: 8,
                                fieldColor: Colors.white,
                                hintText: "Search",
                                onFocous_border_color: Colors.blue,
                                fieldType: TextInputType.text,
                                textForm_Controller: searchNameController),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            height: 7.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      offset: Offset(1, 1),
                                      blurRadius: 10,
                                      spreadRadius: 1),
                                ]),
                            child: IconButton(
                                onPressed: () async {
                                  await get_in_patient_data(context);
                                  // await getPatientProfile(context);
                                  //  print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
                                  //  print(profileResponse.data["allergy"].length);
                                  // // setState(() {

                                  // // });
                                },
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    BuildFiltrationBar4(
                      sortText: sortString,
                      isVisitScreen: false,
                      firstFilter: AppStrings.date,
                      firstFilterPress: () async {
                        POPUB();
                      },
                      secoundFilter: AppStrings.type,
                      secoundFilterPress: () {
                        if (sortString == "A:Z") {
                          setState(() {
                            sortString = "Z:A";
                          });
                        } else {
                          setState(() {
                            sortString = "A:Z";
                          });
                        }
                      },
                      thirdFilter: AppStrings.testName,
                      thirdFilterPress: () {},
                      fourthFilterPress: () {
                        Second_Copy_dialog();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Api_Date1 = null;
                                Api_Date2 = null;
                                searchIdController.clear();
                                searchNameController.clear();
                              });
                            },
                            child: Text(
                              "Clear Filter",
                              style:
                                  TextStyle(fontSize: 10, color: AppColors.red),
                            ))
                      ],
                    ),
                    getInPatient.isNotEmpty
                        ? ListView.builder(
                            itemCount: getInPatient.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: BuildSingleInPatientBar(
                                    user_selected_index: index,
                                    id: getInPatient[index]
                                        .patientID
                                        .toString(),
                                    name:
                                        getInPatient[index].fullName.toString(),
                                    date: DateFormat('yyyy-MM-dd').format(
                                        DateTime.parse(getInPatient[index]
                                            .admissionDate
                                            .toString())),
                                    //inPatientObjectList[index].admissionDate.toString(),
                                    Icon1: Icons.play_circle),
                              );
                            },
                          )
                        : Center(
                            child: AppText("No Data Found !"),
                          )
                  ],
                ),
              ),
            ),
    );
  }
}
