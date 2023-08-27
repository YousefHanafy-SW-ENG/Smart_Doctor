import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/login/presentation/cubit/login_cubit.dart';
import 'package:doctor_final/features/signup/presentation/widgets/inset_text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType keyBoardType;
  final IconData suffixIcon;

  const SignUpTextField({
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.keyBoardType = TextInputType.name,
    this.suffixIcon = Icons.visibility_off,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.06,
      child: InsetTextFieldContainer(
        child: TextFormField(
          style: TextStyle(
            color: AppConstants.isCurrentThemeDark
                ? AppColors.white
                : AppColors.black,
          ),
          decoration: InputDecoration(
            contentPadding: context.read<LoginCubit>().toggleText == 'العربية'
                ? EdgeInsets.only(left: context.width * 0.04)
                : EdgeInsets.only(right: context.width * 0.04),
            border: InputBorder.none,
          ),
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          keyboardType: keyBoardType,
        ),
      ),
    );
  }
}


/*
EdgeInsets.only(
              left: context.width * 0.04,
            ),

*/