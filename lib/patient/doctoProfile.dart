import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_final/features/home/presentation/screens/home_screen.dart';
import 'package:sizer/sizer.dart';
import '../circular_progess.dart';
import '../core/uitls/app_colors.dart';
import '../core/uitls/image_manager.dart';
import '../features/chat/presentation/widgets/my_button.dart';
import '../features/home/presentation/widgets/my_app_bar.dart';
import '../features/login/presentation/widgets/height_seperator.dart';
import '../features/medical_report/presentation/cubit/medical_report_cubit.dart';
import '../features/medical_report/presentation/screens/personal_info_screen.dart';
import '../features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import '../features/medical_report/presentation/widgets/decorated_text_in_container.dart';
import '../features/signup/presentation/widgets/build_double_element.dart';

import '../models/doctorProfileModel.dart';
import '../shared/consts.dart';
import '../translation/Local_Key.g.dart';
import 'Personal_Data_Card.dart';

class doctorProfile extends StatefulWidget {
  const doctorProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<doctorProfile> createState() => _doctorProfileState();
}

class _doctorProfileState extends State<doctorProfile> {

  bool is_Loading = false;
  
  @override
  void initState() {
    getDoctorProfile(context);
    super.initState();
  }

  dynamic getDoctorProfile(BuildContext context) async {
    setState(() {
      is_Loading = true;
    });

    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api getDoctorProfile MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    const String baseUrl = 'http://135.181.119.121:103';

    var myDio = Dio();
    final profileResponse = await myDio.post(
      '$baseUrl/api/SmartDoctorShowDrProfile',
      data: {"doctorID": getLoginDoctor[0].doctorCode, "doctorCode": null},
    );
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api profileResponse good MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    print(
        'response.statusCode response.statusCode ${profileResponse.statusCode.toString()}\n\n');
    print('response.statusCode response ${profileResponse.data.toString()}');

    if (profileResponse.statusCode == 200) {
      getDoctorProfileList = [];
      doctorProfile_Model objectOfDoctor_Model;

      setState(() {
        for (var i in profileResponse.data) {
          objectOfDoctor_Model = doctorProfile_Model.fromJson(i);

          getDoctorProfileList.add(objectOfDoctor_Model);
        }
      });
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

    return Scaffold(
      appBar: myAppBar(
        backButton_onClick: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        leadingWidth: 70,
        appTitle: BuildAppBarTitleWidget(
          image: ImageManager.person,
          text: "Doctor Profile",
        ),
        centerTitle: true,
        hasBackArrow: true,
        context: context,
      ),
      body: is_Loading == true
          ? My_circular_progress()
          : ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                //profile image
                const HeightSeperator(),

                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () async {},
                        child: Align(
                          alignment: Alignment.topLeft,
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
                    ),
                    Expanded(
                      flex: 8,
                      child: DecoratedTextInContainer(
                          getDoctorProfileList[0].docname ?? " "
                          //inPatientObjectList[Selected_index].fullName!,
                          ),
                    ),
                  ],
                ),

                BuildDoubleElement(
                  text: "Doctor id",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].doctorID.toString() ?? " "
                      //inPatientObjectList[Selected_index].patientID.toString(),
                      ),
                ),

                BuildDoubleElement(
                  text: "Doctor code",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].doctorCode.toString() ?? " "
                      //inPatientObjectList[Selected_index].patientID.toString(),
                      ),
                ),

                BuildDoubleElement(
                  text: LocaleKeys.gender.tr(),
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].gender ?? " "
                      //inPatientObjectList[Selected_index].gender!,
                      ),
                ),

                BuildDoubleElement(
                  text: "Mobile Number",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].mobile ?? " "
                      //inPatientObjectList[Selected_index].mobileNumber!,
                      ),
                ),

                BuildDoubleElement(
                  text: "Address",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].doctorAddress ?? " "
                      //inPatientObjectList[Selected_index].theAddress!,
                      ),
                ),

                BuildDoubleElement(
                    text: "Date of Birth",
                    secoundWidget: Display_DateOnly(
                      Date: DateFormat('yyyy-MM-dd').format(DateTime.parse(
                          getDoctorProfileList[0].dateOfBirth ??
                              " ".toString())),
                    )),

                BuildDoubleElement(
                  text: "speciality",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].speciality ?? " "
                      //inPatientObjectList[Selected_index].mobileNumber!,
                      ),
                ),

                BuildDoubleElement(
                  text: "Grade",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].doctorGrade ?? " "
                      //inPatientObjectList[Selected_index].mobileNumber!,
                      ),
                ),

                BuildDoubleElement(
                  text: "Doctor Language",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].drLanguage ?? " "
                      //inPatientObjectList[Selected_index].mobileNumber!,
                      ),
                ),

                BuildDoubleElement(
                  text: "nationality",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].nationality ?? " "
                      //inPatientObjectList[Selected_index].mobileNumber!,
                      ),
                ),

                BuildDoubleElement(
                  text: "Department",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].department ?? " "
                      //inPatientObjectList[Selected_index].mobileNumber!,
                      ),
                ),

                BuildDoubleElement(
                  text: "Notes",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].notes ?? " "
                      //inPatientObjectList[Selected_index].mobileNumber!,
                      ),
                ),

                BuildDoubleElement(
                  text: "Is Resident",
                  secoundWidget: DecoratedTextInContainer(
                      getDoctorProfileList[0].isResident.toString()),
                ),
                
                SizedBox(height: 10,)
              ],
            ),
    );
  }
}
