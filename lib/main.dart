import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/app.dart';
import 'package:doctor_final/core/shared_pref/cash_helper.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_final/features/medical_report/presentation/cubit/medical_report_cubit.dart';
import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
import 'package:doctor_final/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:doctor_final/features/visitScreen/presentation/cubit/visit_screen_cubit.dart';
import 'package:doctor_final/translation/codegen_loader.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/login/presentation/cubit/bloc_observer.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
// ignore: depend_on_referenced_packages

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await CashHelper.init();

  if (kIsWeb) {
    AppConstants.weRunOnWeb = true;
  }

  //CurrentUserInfo.uId = CashHelper.getDate(key: 'userId') ?? '';
  // CurrentUserInfo.name = CashHelper.getDate(key: 'name') ?? '';
  // CurrentUserInfo.typeName = CashHelper.getDate(key: 'typeName') ?? '';
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  BlocOverrides.runZoned(
    blocObserver: blocObserver(),
    () {
      runApp(
        EasyLocalization(
          path: 'assets/translation',
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          fallbackLocale: const Locale('en'),
          startLocale: const Locale('en'),
          saveLocale: false,
          assetLoader: const CodegenLoader(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => LoginCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) => SignupCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) => MedicalReportCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) => ShowResultCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) => VisitScreenCubit(),
              ),
              BlocProvider(
                create: (BuildContext context) => HomeCubit(),
              ),
            ],
            child: MyApp(),
          ),
        ),
      );
    },
  );
}
