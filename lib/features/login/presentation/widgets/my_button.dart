import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color color;
  final Color textColor;

  const MyButton({
    Key? key,
    required this.text,
    required this.color,
    this.textColor = Colors.white,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      width: context.width * 0.5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        onPressed: press,
        elevation: 0,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
