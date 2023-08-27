import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/shared_wIdgets/app_text.dart';
import '../../core/uitls/app_colors.dart';
import '../../core/uitls/image_manager.dart';

class image_Card_doubleTexts extends StatelessWidget {

  final String Patient_name;
  final String Patient_Id ;
  final String Patient_name_Value ;
  final String Patient_Id_Value ;
  final String Image_Network_string;
  final Color parmeters_color;
  final Color parmeters_Value_color;

  const image_Card_doubleTexts({
    this.Patient_Id= "Patient Id/MRN",
    this.Patient_name="Patient_name",
    this.Patient_Id_Value= "53040581",
    this.Patient_name_Value= "ahmed kareem",
    this.parmeters_color= AppColors.blue,
    this.parmeters_Value_color= AppColors.black,
    this.Image_Network_string = 'https://cdn.pixabay.com/photo/2015/11/20/17/29/person-1053543_960_720.jpg',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Column(
        children: [
          Container(
            height: 12.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              )],
              border: Border.all(width: 1,color: Colors.white),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height: 57,
                      width: 57,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.red,
                          width: 2,
                        ),
                      ),
                      child: Image.network(
                        ImageManager.personImageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AppText(
                      "$Patient_name\n\n$Patient_Id",
                      textColor: parmeters_color,
                      align: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: AppText(
                      "$Patient_name_Value \n\n$Patient_Id_Value ",
                      textColor: parmeters_Value_color,
                      align: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          )

          //Mainnnnnnnnnnnnnnnn columnnnnnnnnnnnnnnnnnnnnnnnnn
        ],
      ),
    );
  }
}