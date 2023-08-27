import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../../shared/consts.dart';
import '../../../../translation/Local_Key.g.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {

  @override
  Widget build(BuildContext context) {
    final isSmallDisplay = MediaQuery.of(context).size.width < 600;

    return Row(
      children: [

        Checkbox(
          checkColor: Colors.white,
          activeColor: AppColors.primaryColor,
          side: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
          value: RememberMe_myCheckBox_value,
          onChanged: (value) {
            setState(() {
              RememberMe_myCheckBox_value=value;
            });
          },
        ),

        Padding(
          padding: EdgeInsets.only(bottom: isSmallDisplay ? 0 : 1.h),
          child: Text(LocaleKeys.rememberMe.tr(),
              style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );


  }
}