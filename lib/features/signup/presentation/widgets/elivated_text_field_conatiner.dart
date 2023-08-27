import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

// ignore: must_be_immutable
class ElivatedTextFieldContainer extends StatelessWidget {
  Widget? child;
  Color? color;
  ElivatedTextFieldContainer({
    Key? key,
    this.child,
    this.color = const Color.fromRGBO(255, 255, 255, 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
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
