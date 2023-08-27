import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildSingleCard extends StatelessWidget {
  final String image;
  final String text;
  final int notificationNumber;
  const BuildSingleCard({
    required this.image,
    required this.text,
    required this.notificationNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: Offset(1, 1),
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(
                  //height: 10.h,
                  width: 18.w,
                  child: Image.asset(image),
                ),
              ),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(1.2, -1.2),
          child: Container(
            height: context.height * 0.06,
            width: context.width * 0.11,
            margin: EdgeInsets.only(right: context.width * 0.03),
            decoration: BoxDecoration(
              color: AppColors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                notificationNumber.toString(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 19,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*

Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: SizedBox(
            // height: context.height * 0.23,
            // width: context.width * 0.42,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: context.height * 0.11,
                        width: context.width * 0.22,
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Container(
                          height: context.height * 0.06,
                          width: context.width * 0.11,
                          margin: EdgeInsets.only(right: context.width * 0.03),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              notificationNumber.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    fontSize: 19,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height * 0.015,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Align(
        //   alignment: AlignmentDirectional.topEnd,
        //   child: Container(
        //     height: context.height * 0.06,
        //     width: context.width * 0.11,
        //     margin: EdgeInsets.only(right: context.width * 0.03),
        //     decoration: BoxDecoration(
        //       color: AppColors.primaryColor,
        //       shape: BoxShape.circle,
        //     ),
        //     child: Center(
        //       child: Text(
        //         notificationNumber.toString(),
        //         style: Theme.of(context).textTheme.headline4!.copyWith(
        //               fontSize: 19,
        //             ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );




 */
class BuildSingleCard1 extends StatelessWidget {
  final String image;
  final String text;
  const BuildSingleCard1({
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: Offset(1, 1),
                ),
              ]),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  width: 25.w,
                  child: Image.asset(image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
