import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../circular_progess.dart';
import '../core/uitls/app_colors.dart';
import '../core/uitls/image_manager.dart';
import '../features/chat/presentation/widgets/my_button.dart';
import '../features/login/presentation/widgets/height_seperator.dart';
import '../features/medical_report/presentation/cubit/medical_report_cubit.dart';
import '../features/medical_report/presentation/screens/personal_info_screen.dart';
import '../features/medical_report/presentation/widgets/decorated_text_in_container.dart';
import '../features/signup/presentation/widgets/build_double_element.dart';
import '../shared/consts.dart';
import '../translation/Local_Key.g.dart';
import 'Personal_Data_Card.dart';

class Personal_data extends StatefulWidget {
  const Personal_data({
    Key? key,
  }) : super(key: key);

  @override
  State<Personal_data> createState() => _Personal_dataState();
}

class _Personal_dataState extends State<Personal_data> {


  bool is_Loading = false;






  @override
  void initState() {
    getPatientProfile(context);
    super.initState();
  }

  dynamic getPatientProfile(BuildContext context) async {
    setState(() {
      is_Loading = true;
    });

    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api profileResponse MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    const String baseUrl = 'http://135.181.119.121:103';

    var myDio = Dio();
    profileResponse = await myDio.post(
      '$baseUrl/api/SmartPatientShowProfile',
      data: {
        "registerRequestID":
            58, // patient id // inPatientObjectList[Selected_index].patientID ,
        "Language": 1
      },
    );
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api profileResponse good MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    print(
        'response.statusCode response.statusCode ${profileResponse.statusCode.toString()}\n\n');
    print('response.statusCode response ${profileResponse.data.toString()}');

    if (profileResponse.statusCode == 200) {
    } else {
      // Handle login failure, show error message
      print(
          'MMMMMMMMMMMMMMMMMMMMMMMM Api profileResponse error MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    }
    setState(() {
      is_Loading = false;
    });

    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api profileResponse MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
  }

  @override
  Widget build(BuildContext context) {
    var myCubit = MedicalReportCubit.getCubit(context);

    return is_Loading == true
        ? My_circular_progress()
        : 
        ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              //profile image
              const HeightSeperator(),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () async {},
                      child: CircleAvatar(
                        backgroundColor: AppColors.red,
                        radius: 10.w,
                        child: CircleAvatar(
                          foregroundImage: myCubit.profileImage != null
                              ? NetworkImage(
                                  getInPatient[Selected_index].profilePic)
                              : NetworkImage(ImageManager.personImageUrl),
                          radius: 9.2.w,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: DecoratedTextInContainer(
                        profileResponse.data["patientInfo"][0]["fullName"] ??
                            " "
                        //inPatientObjectList[Selected_index].fullName!,
                        ),
                  ),
                ],
              ),

              BuildDoubleElement(
                text: LocaleKeys.PatientId.tr(),
                secoundWidget: DecoratedTextInContainer(profileResponse
                            .data["patientInfo"][0]["patientID"]
                            .toString() ??
                        " "
                    //inPatientObjectList[Selected_index].patientID.toString(),
                    ),
              ),

              BuildDoubleElement(
                text: LocaleKeys.gender.tr(),
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["gender"] ?? " "
                    //inPatientObjectList[Selected_index].gender!,
                    ),
              ),

              BuildDoubleElement(
                text: LocaleKeys.Age.tr(),
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["age"].toString() ??
                        " "
                    //inPatientObjectList[Selected_index].age.toString() ?? "",
                    ),
              ),

              BuildDoubleElement(
                text: "Id Type",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["idType"] ?? " "
                    //inPatientObjectList[Selected_index].idType!,
                    ),
              ),

              BuildDoubleElement(
                text: "Id Number",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["idNumber"] ?? " "
                    //inPatientObjectList[Selected_index].idNumber! ?? "",
                    ),
              ),

              BuildDoubleElement(
                text: "Mobile Number",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["mobileNumber"] ??
                        " "
                    //inPatientObjectList[Selected_index].mobileNumber!,
                    ),
              ),

              BuildDoubleElement(
                text: "Home Number",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["homeNumber"] ?? " "
                    //'0233962384',
                    ),
              ),

              BuildDoubleElement(
                text: " Address",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["theAddress"] ?? " "
                    //inPatientObjectList[Selected_index].theAddress!,
                    ),
              ),

              BuildDoubleElement(
                  text: "Date of Birth",
                  secoundWidget: Display_DateOnly(
                    Date: DateFormat('yyyy-MM-dd').format(DateTime.parse(
                        profileResponse.data["patientInfo"][0]["dateOfBirth"] ??
                            " ".toString())),

                    //inPatientObjectList[Selected_index].dateOfBirth!,
                  )),

              BuildDoubleElement(
                text: LocaleKeys.job.tr(),
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["job"] ?? " "
                    //inPatientObjectList[Selected_index].job!,
                    ),
              ),

              BuildDoubleElement(
                text: "Marital Status",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["maritalStatus"] ??
                        " "
                    // inPatientObjectList[Selected_index].maritalStatus == null
                    //     ? ""
                    //     : inPatientObjectList[Selected_index].maritalStatus,
                    ),
              ),

              BuildDoubleElement(
                text: "patient State",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["patientState"] ??
                        " "
                    // inPatientObjectList[Selected_index].maritalStatus == null
                    //     ? ""
                    //     : inPatientObjectList[Selected_index].maritalStatus,
                    ),
              ),

              Container(
                margin: EdgeInsets.only(top: context.height * 0.015),
                child: MyButton(
                  press: () {},
                  text: "Insurance",
                  color: AppColors.blue,
                ),
              ),

              BuildDoubleElement(
                text: "Name",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["insuranceName"] ??
                        " "
                    // inPatientObjectList[Selected_index].insuranceName == null
                    //     ? ""
                    //     : inPatientObjectList[Selected_index].insuranceName,
                    ),
              ),

              BuildDoubleElement(
                text: "Company",
                secoundWidget: DecoratedTextInContainer(profileResponse
                        .data["patientInfo"][0]["insuranceCompany"] ??
                    " "),
              ),

              BuildDoubleElement(
                text: "Type",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["insuranceLevel"] ??
                        " "),
              ),

              BuildDoubleElement(
                text: "Id",
                secoundWidget: DecoratedTextInContainer(
                    profileResponse.data["patientInfo"][0]["insuranceNumber"] ??
                        " "
                    // inPatientObjectList[Selected_index].insuranceNumber == null
                    //     ? ""
                    //     : inPatientObjectList[Selected_index].insuranceNumber,
                    ),
              ),

              // BuildDoubleElement(
              //   text: "Level",
              //   secoundWidget: DecoratedTextInContainer(
              //     'Insurance Level',
              //   ),
              // ),

              Container(
                margin: EdgeInsets.only(top: context.height * 0.015),
                child: MyButton(
                  press: () {},
                  text: "Medical Info",
                  color: AppColors.blue,
                ),
              ),

              // Container(
              //   margin: EdgeInsets.only(top: context.height * 0.015),
              //   child: MyButton(
              //     press: () {},
              //     text: "Medical Data",
              //     color: AppColors.blue,
              //   ),
              // ),

              BuildDoubleElement(
                text: LocaleKeys.yourHeight.tr(),
                secoundWidget: Double_decorated_text_in_container(
                    profileResponse.data["patientInfo"][0]["height"]
                            .toString() ??
                        " ".toString(),
                    profileResponse.data["patientInfo"][0]["heightUnit"] ??
                        " ".toString() ??
                        "Cm"),
              ),

              BuildDoubleElement(
                text: LocaleKeys.yourHeight.tr(),
                secoundWidget: Double_decorated_text_in_container(
                    profileResponse.data["patientInfo"][0]["theWeight"]
                            .toString() ??
                        " ".toString(),
                    profileResponse.data["patientInfo"][0]["weightUnit"] ??
                        " ".toString() ??
                        "Cm"),
              ),

              // BuildDoubleElement(
              //   text: LocaleKeys.yourHeight.tr(),
              //   secoundWidget: Double_decorated_text_in_container(
              //       inPatientObjectList[Selected_index].theWeight.toString(),
              //       inPatientObjectList[Selected_index].weightUnit ?? "kg"),
              // ),

              BuildDoubleElement(
                text: LocaleKeys.bloodType.tr(),
                secoundWidget: DecoratedTextInContainer(
                  profileResponse.data["patientInfo"][0]["bloodType"] ?? " ",
                ),
              ),

              BuildDoubleElement(
                text: "Smoking",
                secoundWidget: DecoratedTextInContainer(
                  profileResponse.data["patientInfo"][0]["smokingStatus"] ??
                      " ",
                ),
              ),

              ListView.builder(
                itemCount: profileResponse.data["allergy"].length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BuildDoubleElement(
                    text: (index + 1).toString() +
                        "- " +
                        LocaleKeys.Allergies.tr(),
                    secoundWidget: DecoratedTextInContainer(profileResponse
                                .data["allergy"][index]["allergenName"] ??
                            " "
                        // ' pollen, dust, animal fur, foods',
                        ),
                  );
                },
              ),

              ListView.builder(
                itemCount: profileResponse.data["dieseas"].length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BuildDoubleElement(
                    text:
                        (index + 1).toString() + "- " + LocaleKeys.Disease.tr(),
                    secoundWidget: DecoratedTextInContainer(
                        profileResponse.data["dieseas"][index]["diseaseName"] ??
                            " "
                        // ' pollen, dust, animal fur, foods',
                        ),
                  );
                },
              ),

              ListView.builder(
                itemCount: profileResponse.data["medication"].length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BuildDoubleElement(
                    text:
                        (index + 1).toString() + "- " + LocaleKeys.Disease.tr(),
                    secoundWidget: DecoratedTextInContainer(profileResponse
                                .data["medication"][index]["medicationName"] ??
                            " "
                        // ' pollen, dust, animal fur, foods',
                        ),
                  );
                },
              ),

              ListView.builder(
                itemCount: profileResponse.data["operation"].length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BuildDoubleElement(
                    text:
                        (index + 1).toString() + "- " + LocaleKeys.Disease.tr(),
                    secoundWidget: DecoratedTextInContainer(profileResponse
                                .data["operation"][index]["operationName"] ??
                            " "
                        // ' pollen, dust, animal fur, foods',
                        ),
                  );
                },
              ),

              // Container(
              //   margin: EdgeInsets.only(top: context.height * 0.015),
              //   child: MyButton(
              //     press: () {},
              //     text: "Medical History",
              //     color: AppColors.blue,
              //   ),
              // ),

              // BuildDoubleElement(
              //   text: "Please add diagnosis if you have any",
              //   secoundWidget: DecoratedTextInContainer(
              //     '',
              //   ),
              // ),

              // BuildDoubleElement(
              //   text: "Please add allergies if you have any",
              //   secoundWidget: DecoratedTextInContainer(
              //     '',
              //   ),
              // ),

              // BuildDoubleElement(
              //   text: "Please add operations if you did any",
              //   secoundWidget: DecoratedTextInContainer(
              //     '',
              //   ),
              // ),

              // BuildDoubleElement(
              //   text: "Please add Medication if you have take any",
              //   secoundWidget: DecoratedTextInContainer(
              //     '',
              //   ),
              // ),

              // const HeightSeperator(),

              // Container(
              //   margin: EdgeInsets.only(top: context.height * 0.015),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: AppColors.babyBlue,
              //     // shape: BoxShape.circle,
              //   ),
              //   child: PersonalData_Card_widget(
              //     title_name: "Radiology",
              //     item_count: 3,
              //   ),
              // ),

              Container(
                margin: EdgeInsets.only(top: context.height * 0.015),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.babyBlue,
                  // shape: BoxShape.circle,
                ),
                child: PersonalData_Card_widget(
                  title_name: "Lab",
                  item_count: 2,
                ),
              ),
              SizedBox(
                height: 250,
              ),
            ],
          );
  }
}
