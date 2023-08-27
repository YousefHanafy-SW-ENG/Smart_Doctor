import 'package:flutter/cupertino.dart';

import '../../core/shared_wIdgets/app_text.dart';
import '../../core/uitls/app_colors.dart';

class PersonalData_Card_widget extends StatefulWidget {
  String title_name;
  int item_count;
  PersonalData_Card_widget({
    super.key,
    required this.title_name,
    this.item_count = 3,
  });

  @override
  State<PersonalData_Card_widget> createState() =>
      _PersonalData_Card_widgetState();
}

class _PersonalData_Card_widgetState extends State<PersonalData_Card_widget> {
  int? Open_index = null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: AppText(
              widget.title_name,
              textColor: AppColors.red,
              fontWeigth: FontWeight.bold,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.item_count,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                    // shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Container(
                        height: 50,

                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        if (Open_index == index) {
                                          setState(() {
                                            Open_index = null;
                                          });

                                        }else{
                                          setState(() {
                                            Open_index = index;
                                          });
                                        }
                                      },
                                      child: Center(child: AppText("pic")))),
                              Expanded(
                                child: Center(child: AppText("Name")),
                              ),
                              Expanded(
                                child: Center(child: AppText("Clinic")),
                              )
                            ],
                          ),
                        ),
                      ),






                      index!=Open_index?
                      SizedBox.shrink()
                          :
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.white,
                          ),

                          child: Image.network(
                            "https://www.bachelorprint.co.uk/wp-content/uploads/2023/07/Lab-report-Definition.jpg",
                            height: 145,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )




                    ],
                  ),
                ),
              );




            },
          ),
        ],
      ),
    );
  }
}