import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String text, Color color = Colors.green}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
