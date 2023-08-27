import 'package:doctor_final/config/routes/app_routes.dart';
import 'package:doctor_final/core/shared_pref/cash_helper.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/app_strings.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/core/uitls/app_navigation_functions.dart';
import 'package:doctor_final/features/login/presentation/widgets/back_ground.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => OnBoardingScreensState();
}

class OnBoardingScreensState extends State<OnBoardingScreens> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        screen: Column(
          children: [
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: context.height * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.skip,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 20),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: AppColors.primaryColor,
                      size: 35,
                    ),
                  ],
                ),
              ),
              onTap: () {
                CashHelper.saveData(key: 'onBoarding', value: true).then(
                  (value) {
                    if (value) {
                      AppNavigation.pushAndDelete(
                          route: Routes.loginScreen, context: context);
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: context.height * 0.7,
              width: double.infinity,
              child: PageView(
                controller: controller,
                children: [
                  pageBuilder(
                    text: 'learn a lot of courses from facebook ',
                    image: Image.asset(
                      ImageManager.faceBook,
                    ),
                  ),
                  pageBuilder(
                    text: 'learn a lot of courses twitter ',
                    image: Image.asset(
                      ImageManager.twitter,
                    ),
                  ),
                  pageBuilder(
                    text: 'learn a lot of courses whats app ',
                    image: Image.asset(
                      ImageManager.wts,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.white,
              width: context.width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      dotHeight: context.height * 0.011,
                      dotWidth: context.width * 0.024,
                      activeDotColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget pageBuilder({
  required String text,
  required var image,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 50.0,
      left: 25,
      right: 25,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: image,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
          ),
        ),
      ],
    ),
  );
}
