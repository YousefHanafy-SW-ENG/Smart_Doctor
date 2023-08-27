import 'package:doctor_final/config/routes/app_routes.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/app_navigation_functions.dart';
import 'package:doctor_final/core/uitls/app_strings.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/login/presentation/cubit/login_cubit.dart';
import 'package:doctor_final/features/login/presentation/widgets/back_ground.dart';
import 'package:doctor_final/features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataSavedSuccessfulyScreen extends StatelessWidget {
  const DataSavedSuccessfulyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: context.read<LoginCubit>().toggleText == 'العربية'
              ? Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: AppConstants.isCurrentThemeDark
                      ? AppColors.white
                      : AppColors.darkBlack,
                )
              : const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.black,
                ),
          onPressed: () {
            AppNavigation.pushAndDelete(
              route: Routes.homeScreen,
              context: context,
            );
          },
        ),
        title: BuildAppBarTitleWidget(
          image: ImageManager.medicalReport,
          text: AppStrings.medicalReport,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              ImageManager.hospital,
            ),
          ),
        ],
      ),
      body: BackGround(
        isContainAppBar: true,
        screen: Column(
          children: [
            SizedBox(
              height: context.height * 0.1,
              width: context.width * 0.1,
              // child: Icon(Icons.),
            ),
            Text(AppStrings.yourDataSuccessfulySaved),
          ],
        ),
      ),
    );
  }
}
