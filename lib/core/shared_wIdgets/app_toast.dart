import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

appToast(String text, {Color color = Colors.green}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
