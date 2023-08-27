
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class M_Textform extends StatelessWidget{
  double? width;
  double? height;
  double borderRadius;
  TextInputType fieldType;
  String? hintText;
  Color? fieldColor;

  Widget? prefixIcon;
  Widget? sufixfixIcon;
  TextEditingController textForm_Controller;
  bool? onsubmit;
  void Function(String?)? onChanged;
  bool secureTexet;
  VoidCallback? ontap;
  String? Function(String?)? valditor;
  List<TextInputFormatter>? inputFormatter;
  var  TTextAlign;
  String? Function(String?)? onSubmitted;
  Color Border_color;
  Widget? suffix_widget;
  Color onFocous_border_color;
  bool Read_only;
  int ?my_Maxlines;


  M_Textform(
      {
        this.height,
        this.width,
        this.borderRadius=9,
        required this.fieldType,
        this.hintText,
        this.fieldColor,

        this.prefixIcon,
        this.sufixfixIcon,
        this.onChanged,
        this.onsubmit,
        required this.textForm_Controller,
        this.secureTexet=false,
        this.valditor,
        this.inputFormatter,
        this.ontap,
        this.TTextAlign=TextAlign.start,
        this.onSubmitted,
        this.Border_color=Colors.white,
        this.suffix_widget,
        this.onFocous_border_color=Colors.green,
        this.Read_only=false,
        this.my_Maxlines,
      }
      );



  @override
  Widget build(BuildContext context) {




    return Container(

      width:width,
      height: height,

      child: TextFormField(
        maxLines:my_Maxlines ,
        readOnly:Read_only ,
        onTap: ontap,
        obscureText: secureTexet,
        controller: textForm_Controller,
        keyboardType: fieldType,
        validator: valditor,
        onFieldSubmitted: onSubmitted,
        onChanged:onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: fieldColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ),
            borderSide: BorderSide(
              color:onFocous_border_color ,

            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ),
            borderSide: BorderSide(
              color: Border_color,

            ),
          ),
          border: OutlineInputBorder(
            borderSide:  BorderSide(
              color:Border_color,
            ),
            borderRadius: BorderRadius.circular(borderRadius ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: sufixfixIcon,
          suffix: suffix_widget,

        ),
        inputFormatters: inputFormatter,
        textAlign:TTextAlign,
      ),
    );
  }
}