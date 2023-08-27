// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';


dynamic Error_Message(
    {required BuildContext Get_context, required String Error_Message}) {
  return showDialog(
      context: Get_context,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding:EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:AppColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                        color: Color.fromARGB(255, 120, 120, 120),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    child: Text(' Un Expected Api Error Occured '),
                  ),
                  
                  // Text(
                  //   "Error Occured ",
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 120, 120, 120),
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      onPressed: () {

                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Tooltip(
                          
                          decoration: BoxDecoration(
                            color: Colors.black
                          ),
                          textStyle: TextStyle(
                            color: AppColors.white,
                            fontSize: 13
                          ),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          showDuration: Duration(seconds: 10),
                          message: "$Error_Message\n[ For Developer More Info Check Debug Console ! ]\n",
                          triggerMode: TooltipTriggerMode.tap,
                          child: Text(
                            "More Info",
                            style: TextStyle(color:AppColors.blue),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      });
}
