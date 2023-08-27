import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final Function(String)? onFieldSubmitted;
  final bool alwaysEnableEditing;
  final Color borderColor;
  final String hintText;
  final bool isPassword;
  // final bool isOnlyNumbers;
  final Function(String)? onEditComplete;
  final Widget? suffex;
  final TextInputType keyBoardType;
  const AppTextField({
    super.key,
    required this.controller,
    this.validation,
    this.onFieldSubmitted,
    this.alwaysEnableEditing = true,
    this.borderColor = Colors.grey,
    this.hintText = '',
    this.isPassword = false,
    // this.isOnlyNumbers = false,
    this.onEditComplete,
    this.suffex,
    this.keyBoardType = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 4.h,
      child: TextFormField(
        keyboardType: keyBoardType,
        // inputFormatters: [
        //   // isOnlyNumbers
        //   //     ? FilteringTextInputFormatter.digitsOnly
        //   //     : FilteringTextInputFormatter.singleLineFormatter,
        //   isOnlyNumbers
        //       ? FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
        //       // : FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9 ]'))
        //       : FilteringTextInputFormatter.singleLineFormatter,
        // ],
        style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w600),
        enabled: alwaysEnableEditing,
        controller: controller,

        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 1.2.w,
            vertical: 0,
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 209, 29, 16), width: 1)),
          errorStyle: const TextStyle(fontSize: 0.1),
          fillColor: alwaysEnableEditing ? Colors.white : Colors.grey[300],
          filled: true,
          suffix: suffex,
        ),
        onFieldSubmitted: onFieldSubmitted,
        validator: validation,
        obscureText: isPassword,
        onChanged: onEditComplete,
      ),
    );
  }
}
