import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldContainer extends StatelessWidget {
  Widget? child;
  Color? color;
  TextFieldContainer({
    Key? key,
    this.child,
    this.color = const Color.fromRGBO(248, 248, 248, 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          left: 15.0,
          bottom: 8.0,
          right: 8.0,
        ),
        child: child,
      ),
    );
  }
}
