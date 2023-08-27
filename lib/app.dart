import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/core/shared_pref/cash_helper.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  final bool onBoarding = CashHelper.getDate(key: 'onBoarding') ?? false;
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              theme: AppConstants.isCurrentThemeDark
                  ? ThemeClass.darkTheme()
                  : ThemeClass.lightTheme(),
              debugShowCheckedModeBanner: false,
              initialRoute:
                  onBoarding ? Routes.loginScreen : Routes.initialRoute,
            );
          },
        );
      },
    );
  }
}
