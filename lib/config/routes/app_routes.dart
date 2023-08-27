import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/features/login/presentation/screens/login_screen.dart';
import 'package:doctor_final/features/login/presentation/screens/login_web_screen.dart';
import 'package:doctor_final/features/medical_report/presentation/screens/data_saved_successfully_screen.dart';
import 'package:doctor_final/features/medical_report/presentation/screens/fill_your_data.dart';
import 'package:doctor_final/features/on_boarding_Screen/on_boarding_screen.dart';
import 'package:doctor_final/features/show_result/presentation/screens/screen_arguments.dart';
import 'package:doctor_final/features/show_result/presentation/screens/view_image.dart';
import 'package:doctor_final/features/show_result/presentation/screens/show_result_screen.dart';
import 'package:doctor_final/features/show_result/presentation/screens/spacific_result_screen.dart';
import 'package:doctor_final/features/visitScreen/presentation/screens/visit_screen.dart';
import 'package:doctor_final/test_screen.dart';
import 'package:flutter/material.dart';

import '../../core/uitls/app_strings.dart';
import '../../features/signup/presentation/screens/sign_up_screen.dart';
import '../../patient/splashScreen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginScreen = '/login';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String medicalScreen = '/medicalScreen';
  static const String showResultScreen = '/showResult';
  static const String spacificResult = '/spacificResult';
  static const String dataSavedSuccess = '/dataSavedSucessfuly';
  static const String viewImage = '/viewImage';
  static const String readiologyScreen = '/radiologyScreen';
  static const String visitScreen = '/visitScreen';
  static const String fillYourData = '/fillYourData';
  static const String testScreen = '/testScreen';
  static const String homeChatScreen = '/homeChatScreen';
  static const String searchChatScreen = '/searchChatScreen';
  static const String conversationChatScreen = '/conversationChatScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return AppConstants.weRunOnWeb
                ? const LoginWebScreen()
                : const OnBoardingScreens();
          },
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );

      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SignUpScreen();
      //     },
      //   );

      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const HomeScreen();
      //     },
      //   );

      // case Routes.medicalScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //      // return const PersonalInfoScreen();
      //     },
      //   );

      // case Routes.showResultScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const ShowResultScreen();
      //     },
      //   );
      // case Routes.spacificResult:
      //   var s = routeSettings.arguments as ScreenArguments;
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SpacificResultScreen(
      //         appBarTitle: s.title,
      //         appBarImage: s.image,
      //       );
      //     },
      //   );
      // case Routes.dataSavedSuccess:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const DataSavedSuccessfulyScreen();
      //     },
      //   );
      // case Routes.viewImage:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const ViewImage();
      //     },
      //   );
      // case Routes.visitScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const VisitsScreen();
      //     },
      //   );

      // case Routes.fillYourData:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return FillYourDataScreen();
      //     },
      //   );
      // case Routes.testScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const TestScreen();
      //     },
      //   );

      // case Routes.homeChatScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return HomeChatScreen();
      //     },
      //   );
      // case Routes.searchChatScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return SearchChatScreen();
      //     },
      //   );
      // case Routes.conversationChatScreen:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return ConversationChatScreen();
      //     },
      //   );

      default:
        return unDifiendRoute();
    }
  }

  static Route<dynamic> unDifiendRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      );
    });
  }
}
