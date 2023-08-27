import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../uitls/app_colors.dart';

class AppDropDownButton extends StatelessWidget {
  final List<String> listOfItems;
  final String changedValue;
  final void Function(String?)? onChange;
  final void Function(String?)? validator;
  final Color borderColor;
  final String? hint;

  const AppDropDownButton({
    super.key,
    required this.listOfItems,
    required this.onChange,
    required this.changedValue,
    this.validator,
    this.borderColor = Colors.grey,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.1.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(-2, 0),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        icon: Icon(Icons.keyboard_arrow_up_sharp, color: AppColors.red),
        focusColor: AppColors.red,

        isExpanded: true,
        // style: TextStyle(overflow: TextOverflow.fade),
        value: (changedValue == '' || !listOfItems.contains(changedValue))
            ? null
            : changedValue,
        // elevation: 16,
        // underline: Container(
        //   height: 2,
        //   color: Colors.deepPurpleAccent,
        // ),
        items: listOfItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: AlignmentDirectional.center,
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 10.sp),
            ),
          );
        }).toList(),
        onChanged: onChange,
        hint: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Text(
            hint ?? LocaleKeys.pleaseSelect.tr(),
            style: TextStyle(
              fontSize: 10.sp,
              overflow: TextOverflow.visible,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.01),
          contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      // child: DropdownSearch<String>(
      //   items: listOfItems,
      //   selectedItem: changedValue,
      //   onChanged: onChange,
      //   popupProps: const PopupProps.menu(
      //     showSelectedItems: true,
      //   ),
      //   dropdownDecoratorProps: const DropDownDecoratorProps(
      //     dropdownSearchDecoration: InputDecoration(
      //       border: InputBorder.none,
      //     ),
      //   ),
      // ),
    );
  }
}
