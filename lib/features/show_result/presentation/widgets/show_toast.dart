import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String text}) => Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
