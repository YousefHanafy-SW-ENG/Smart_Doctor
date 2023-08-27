import 'package:dio/dio.dart';
import 'package:doctor_final/core/shared_wIdgets/app_toast.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginCubit getCubit(context) => BlocProvider.of(context);
  Dio dio = Dio();

  TextEditingController userName = TextEditingController(text: '01230');
  TextEditingController password = TextEditingController(text: '1234567Mm*');

  String flagImage = ImageManager.egypt;
  String toggleText = 'العربية';

  IconData textFieldIcon = Icons.visibility_off;

  //english == o , arabic == 1 ;
  int languageIndex = 0;

  bool isPasswrord = true;
  void changePasswrdVisibility() {
    if (textFieldIcon == Icons.visibility_off) {
      textFieldIcon = Icons.visibility;
      isPasswrord = false;
    } else {
      textFieldIcon = Icons.visibility_off;
      isPasswrord = true;
    }
    emit(ChangePasswordVisibility());
  }

  void toggleLanguage() async {
    if (flagImage == ImageManager.egypt) {
      flagImage = ImageManager.ukFlag;
      toggleText = 'English';
    } else {
      flagImage = ImageManager.egypt;
      toggleText = 'العربية';
    }
    emit(ChangeLanguageState());
  }

  Future<void> login() async {
    dio.post(
      'http://192.168.1.200:91/api/SmartPatientLogin',
      data: {
        "IDNumber": userName.text,
        "Password": password.text,
      },
    ).then((value) {
      if (value.data[0]['registerRequestID'] != 0) {
        AppConstants.registerID = value.data[0]['registerRequestID'];
        emit(LoginSuccessFullyState());
      }
      appToast(value.data[0]['resultMessage']);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
