import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../../circular_progess.dart';
import '../../../../core/shared_wIdgets/app_text.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../../models/doctor_login__model/doctor_model.dart';
import '../../../../shared/consts.dart';
import '../../../../translation/Local_Key.g.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../widgets/hospital_image.dart';
import '../widgets/my_button.dart';
import '../widgets/remember_me.dart';
import '../widgets/height_seperator.dart';
import '../widgets/text_field_builder.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool is_Loading = false;
  
  @override
  void initState() {
    super.initState();
    shared_pref_get();
  }

  IconData password_TextFieldIcon = Icons.visibility_off;

  final logInFormKey = GlobalKey<FormState>();
  bool isPassword = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  shared_pref_get() async {
    SharedPreferences myPref = await SharedPreferences.getInstance();

    if (myPref.getBool("skip login") == true) {
      getLoginDoctor.clear();
      DoctorLoginModel userModel = DoctorLoginModel(
        doctorName: myPref.getString("doctor name")!,
        doctorCode: myPref.getInt("doctor code")!,
      );
      getLoginDoctor.add(userModel);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }




  shared_pref_set({
    required key,
    required value,
    required key2,
    required value2,
    required key3,
    required value3,
  }) async {
    SharedPreferences myPref = await SharedPreferences.getInstance();
    myPref.setString(key, value);
    myPref.setInt(key2, value2);
    myPref.setBool(key3, value3);

    //print(key5+value5.toString());
    print("shared_pref_set success");
  }

  Future<void> _login(BuildContext context) async {
    setState(() {
      is_Loading = true;
    });

    print('MMMMMMMMMMMMMMMMMMMMMMMM Api Login MMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    const String baseUrl = 'http://135.181.119.121:103';

    final username = usernameController.text;
    final password = passwordController.text;

    // print('MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM');

    var myDio = Dio();
    final response = await myDio.post(
      '$baseUrl/api/DoctorUsersLogin',
      data: {
        'username': username,
        'password': password,
      },
    );
    print(
        'MMMMMMMMMMMMMMMMMMMMMMMM Api Login good MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    print(
        'response.statusCode response.statusCode ${response.statusCode.toString()}\n\n');
    print('response.statusCode response ${response.data.toString()}');

    if (response.statusCode == 200 && response.data.toString() != "[]") {
      DoctorLoginModel userModel;
      setState(() {
        for (var i in response.data) {
          userModel = DoctorLoginModel.fromJson(i);

          getLoginDoctor.add(userModel);
          print('Object Added to List of object');
        }
        print('my List of object  $getLoginDoctor');
      });

      if (RememberMe_myCheckBox_value == true) {
        await shared_pref_set(
            key: "doctor name",
            value: getLoginDoctor[0].doctorName,
            key2: "doctor code",
            value2: getLoginDoctor[0].doctorCode,
            key3: "skip login",
            value3: true);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Login Success",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        //"This Email didn't Sign up Yet"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        showCloseIcon: true,
        closeIconColor: Colors.white,
      ));
    } else {
      print(
          'MMMMMMMMMMMMMMMMMMMMMMMM Api Login error MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Un correct User name or Password",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        //"This Email didn't Sign up Yet"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 163, 15, 15),
        showCloseIcon: true,
        closeIconColor: Colors.white,
      ));
      // Handle login failure, show error message
    }

    print('MMMMMMMMMMMMMMMMMMMMMMMM Api Login MMMMMMMMMMMMMMMMMMMMMMMMMMMM');
    setState(() {
      is_Loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> myformstate = new GlobalKey<FormState>();

    return Scaffold(
      body: is_Loading == true
          ? My_circular_progress()
          : Padding(
              padding: EdgeInsets.only(
                top: context.height * 0.052,
                left: context.width * 0.05,
                right: context.width * 0.05,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  // const Align(
                  //   alignment: AlignmentDirectional.topEnd,
                  //   child: ToggleLanguageButton(),
                  // ),
                  // const HeightSeperator(),
                  const Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: HospitalImage(),
                  ),
                  const HeightSeperator(height: 5),
                  Center(
                    child: AppText(
                      // AppStrings.theInternationalHospital,
                      LocaleKeys.smartPatient.tr(),
                      fontSize: 18.sp,
                    ),
                  ),
                  const HeightSeperator(height: 2),

                  const HeightSeperator(),
                  Form(
                    key: logInFormKey,
                    child: Column(
                      children: [
                        TextFieldBuilder(
                          hasBorder: true,
                          text: LocaleKeys.yourIdNumber.tr(),
                          icon: Icons.person,
                          containSuffix: false,
                          controller: usernameController,
                        ),
                        SizedBox(
                          height: context.height * 0.03,
                        ),
                        TextFieldBuilder(
                          hasBorder: true,
                          text: LocaleKeys.password.tr(),
                          isPassword: isPassword,
                          containSuffix: true,
                          controller: passwordController,
                          icon: Icons.lock,
                          eyePress: () {
                            if (password_TextFieldIcon ==
                                Icons.visibility_off) {
                              setState(() {
                                isPassword = false;
                                password_TextFieldIcon = Icons.visibility;
                              });
                            } else {
                              setState(() {
                                isPassword = true;
                                password_TextFieldIcon = Icons.visibility_off;
                              });
                            }
                          },
                          suffixIcon: password_TextFieldIcon,
                        ),
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () async {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Align(
                  //       alignment: AlignmentDirectional.topEnd,
                  //       child: Text(
                  //         LocaleKeys.forgetPassword.tr(),
                  //         style: Theme.of(context).textTheme.displayMedium,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  const RememberMe(),

                  MyButton(
                    color: AppColors.primaryColor,
                    text: LocaleKeys.login.tr(),
                    press: () async {
                      var current_formState = logInFormKey.currentState;

                      if (current_formState!.validate()) {
                        //in case textform validator is valid

                        print("valid");

                        await _login(context);
                      } else {
                        //in case textform validator un valid
                        print("un valid");
                      }

                      // () => _login(context);
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
