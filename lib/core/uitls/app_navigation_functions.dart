import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static void pushAndDelete({required String route, required context}) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  static void pop({required context}) {
    Navigator.pop(context);
  }

  // static void push(
  //     {required String route, required context, required String AppTitle}) {
  //   Navigator.pushNamed(context, route, arguments: {'appTitle': AppTitle});
  // }
}
