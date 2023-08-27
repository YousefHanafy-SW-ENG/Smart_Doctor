// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types, use_full_hex_values_for_flutter_colors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../models/doctor_login__model/doctor_model.dart';
import '../shared/consts.dart';


class splash_screen extends StatefulWidget {
  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  
  
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



  @override
  void initState() {
    
    super.initState();

    Timer(Duration(seconds: 3), () {
     shared_pref_get();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
               ImageManager.hospital,
              width: 80.w,
              height: 50.h,
              fit: BoxFit.contain,
            ),
            
            Text(
              'AlSHEFA HOSPITAL', // The text to display
              style: TextStyle(
                  fontSize: 40, // Use a large font size
                  // Make the text bold
                  color: AppColors.blue,
                  fontFamily: "Myfont" // Set the text color to white
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
