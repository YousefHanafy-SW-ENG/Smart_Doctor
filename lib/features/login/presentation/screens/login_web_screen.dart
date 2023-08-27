import 'package:easy_localization/easy_localization.dart';
import 'package:doctor_final/config/routes/app_routes.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/app_navigation_functions.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/login/presentation/widgets/my_button.dart';
import 'package:doctor_final/features/login/presentation/widgets/remember_me.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginWebScreen extends StatelessWidget {
  const LoginWebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = 100.w;

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
              ),
              child: ListView(
                shrinkWrap: true,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 35.h,
                    child: Image.asset(
                      ImageManager.hospital,
                    ),
                  ),
                  Center(
                    child: Text(
                      LocaleKeys.smartPatient.tr(),
                      style: TextStyle(fontSize: 8.sp),
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.4,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.02,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: LocaleKeys.yourIdNumber.tr(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.01,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: LocaleKeys.password.tr(),
                            ),
                          ),
                        ),
                        const RememberMe(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.2,
                    child: MyButton(
                      color: AppColors.primaryColor,
                      text: LocaleKeys.login.tr(),
                      press: () {
                        AppNavigation.pushAndDelete(
                            route: Routes.homeScreen, context: context);
                      },
                    ),
                  ),
                  if (deviceWidth <= 770)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.dontHaveAccount.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        InkWell(
                          onTap: () {
                            AppNavigation.pushAndDelete(
                                route: Routes.signUpScreen, context: context);
                          },
                          child: Text(
                            LocaleKeys.signUp.tr(),
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          if (deviceWidth > 770)
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.darkGery,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Here ?',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: context.height * 0.05),
                      Text(
                        'sign up now and join us to become a member of our community',
                        style: TextStyle(
                          fontSize: 5.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: context.height * 0.1),
                      MyButton(
                        press: () {
                          AppNavigation.pushAndDelete(
                              route: Routes.signUpScreen, context: context);
                        },
                        color: AppColors.white,
                        text: LocaleKeys.signUp.tr(),
                        textColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
