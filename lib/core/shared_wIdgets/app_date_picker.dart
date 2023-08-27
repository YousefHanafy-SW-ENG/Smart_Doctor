import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppDatePicker extends StatefulWidget {
  final void Function(DateTime?) onChange;
  final dynamic initialDate;
  final DateTime? lastDate;
  final bool isAlwaysEbabled;

  const AppDatePicker({
    super.key,
    required this.onChange,
    required this.initialDate,
    this.isAlwaysEbabled = false,
    this.lastDate,
  });

  @override
  AppDatePickerState createState() => AppDatePickerState();
}

class AppDatePickerState extends State<AppDatePicker> {
  String? _selectedDate;
  @override
  void initState() {
    if (widget.initialDate != null && widget.initialDate != 'null') {
      _selectedDate =
          DateFormat('yyyy/MM/dd').format(DateTime.parse(widget.initialDate));
    }
    super.initState();
  }

  Future<void> _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        _selectedDate = DateFormat('yyyy/MM/dd').format(date);
        widget.onChange(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDatePicker,
      child: Container(
        height: 5.5.h,
        padding: EdgeInsets.symmetric(horizontal: 1.5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedDate ?? LocaleKeys.pleaseSelect.tr(),
              style: TextStyle(
                fontSize: 12.sp,
                color: _selectedDate == null ? Colors.black : Colors.black,
              ),
              overflow: TextOverflow.visible,
            ),
            SizedBox(
              height: 3.h,
              child: Image.asset('assets/images/calender.png'),
            ),
          ],
        ),
      ),
    );
  }
}
