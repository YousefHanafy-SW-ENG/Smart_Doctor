import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_final/patient/inPatient_screen.dart';
import 'package:doctor_final/patient/personal_data.dart';
import 'package:sizer/sizer.dart';

import '../core/uitls/app_colors.dart';
import '../core/uitls/constants.dart';
import '../core/uitls/image_manager.dart';
import '../features/home/presentation/widgets/my_app_bar.dart';
import '../features/login/presentation/widgets/height_seperator.dart';
import '../features/medical_report/presentation/widgets/build_appbar_title_widget.dart';
import '../translation/Local_Key.g.dart';
import 'hospital_data 2.dart';
import 'hospital_data.dart';

class InpatientData extends StatefulWidget {
  const InpatientData({Key? key}) : super(key: key);

  @override
  State<InpatientData> createState() => _InpatientDataState();
}

class _InpatientDataState extends State<InpatientData> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isSmallDisplay = MediaQuery.of(context).size.width < 600;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: myAppBar(
        backButton_onClick: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => inPatientScreen()
              ));
        },
        leadingWidth: 7.h,
        appTitle: BuildAppBarTitleWidget(
          image: ImageManager.inPatients,
          text: LocaleKeys.inPatients.tr(),
        ),
        centerTitle: true,
        hasBackArrow: true,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (AppConstants.weRunOnWeb)
                Container(
                  height: 7.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.lightGery,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                      Text(
                        LocaleKeys.home.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      Image.asset(ImageManager.hospital),
                    ],
                  ),
                ),
              HeightSeperator(height: 2.h),
              Container(
                margin: EdgeInsets.only(top: 1.5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0,
                          2), // Offset to create the shadow effect from the right side
                    ),
                  ],
                ),
                height: 6.h,
                child: TabBar(
                  controller: _tabController,
                  labelStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  labelColor: AppColors.white,
                  indicator: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  unselectedLabelColor: AppColors.blue,
                  tabs: [
                    Tab(text: LocaleKeys.hospitalData.tr()),
                    Tab(text: LocaleKeys.personalData.tr()),
                  ],
                ),
              ),
              SizedBox(
                height: 105.h,
                width: 500,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    HospitalData2(),
                    Personal_data(),
                  ],
                ),
              ),
              // * personal info
              // InkWell(
              //   child: BuildCard(
              //     showNotificationCircule: false,
              //     icon: ImageManager.medicalReport,
              //     text: LocaleKeys.personalData.tr(),
              //   ),
              //   onTap: () {
              //     // closeVisitsOrResultOverlay(context);
              //     Navigator.pushNamed(
              //       context,
              //       Routes.medicalScreen,
              //       arguments: {
              //         'appTitle': LocaleKeys.personalData.tr(),
              //       },
              //     );
              //   },
              // ),
              // HeightSeperator(height: 2.h),
              // // * Booking
              // InkWell(
              //   child: BuildCard(
              //     showNotificationCircule: false,
              //     icon: 'assets/images/booking.png',
              //     text: LocaleKeys.booking.tr(),
              //   ),
              //   onTap: () {},
              // ),
              // HeightSeperator(height: 2.h),
              // * invoices

              // InkWell(
              //   child: BuildCard(
              //     showNotificationCircule: true,
              //     icon: ImageManager.showRes,
              //     text: LocaleKeys.showResults.tr(),
              //   ),
              //   onTap: () {
              //     showDialog(
              //         context: context,
              //         builder: (context) {
              //           return Dialog(
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(30.0),
              //             ),
              //             child: const _VisitOrResultDialog(),
              //           );
              //         });
              //   },
              // ),
              // HeightSeperator(height: 2.h),
              // InkWell(
              //   child: BuildCard(
              //     showNotificationCircule: false,
              //     icon: 'assets/images/invoice.png',
              //     text: LocaleKeys.invoices.tr(),
              //   ),
              //   onTap: () {
              //     // closeVisitsOrResultOverlay(context);
              //     // Navigator.pushNamed(
              //     //   context,
              //     //   Routes.medicalScreen,
              //     //   arguments: {
              //     //     'appTitle': LocaleKeys.personalData.tr(),
              //     //   },
              //     // );
              //   },
              // ),
              // HeightSeperator(height: 2.h),
              //
              // InkWell(
              //   child: BuildCard(
              //     showNotificationCircule: true,
              //     icon: 'assets/images/survey.png',
              //     text: LocaleKeys.survey.tr(),
              //     number: 3,
              //   ),
              //   onTap: () {
              //     // closeVisitsOrResultOverlay(context);
              //     // Navigator.pushNamed(
              //     //   context,
              //     //   Routes.medicalScreen,
              //     //   arguments: {
              //     //     'appTitle': LocaleKeys.personalData.tr(),
              //     //   },
              //     // );
              //   },
              // ),
              // HeightSeperator(height: 2.h),
              //
              // InkWell(
              //   child: BuildCard(
              //     showNotificationCircule: false,
              //     icon: 'assets/images/complaint.png',
              //     text: LocaleKeys.complaint.tr(),
              //     textSize: 15,
              //   ),
              //   onTap: () {
              //     // closeVisitsOrResultOverlay(context);
              //     // Navigator.pushNamed(
              //     //   context,
              //     //   Routes.medicalScreen,
              //     //   arguments: {
              //     //     'appTitle': LocaleKeys.personalData.tr(),
              //     //   },
              //     // );
              //   },
              // ),
              // HeightSeperator(height: 2.h),
              // InkWell(
              //   child: BuildCard(
              //     showNotificationCircule: false,
              //     icon: ImageManager.logOut,
              //     text: LocaleKeys.logOut.tr(),
              //   ),
              //   onTap: () {
              //     // closeVisitsOrResultOverlay(context);
              //
              //     SignupCubit.getCubit(context).clearAllControllers();
              //     AppNavigation.pushAndDelete(
              //         route: Routes.loginScreen, context: context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}