import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/uitls/app_colors.dart';
import '../core/uitls/app_strings.dart';
import '../core/uitls/image_manager.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/home/presentation/widgets/my_app_bar.dart';
import '../features/medical_report/presentation/widgets/build_appbar_title_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final _initialCalendarDate = DateTime.now().subtract(Duration(days: 365));
  final _lastCalendarDate = DateTime.now().add(Duration(days: 365));

  // Define your focused calendar date
  DateTime _focusedCalendarDate = DateTime.now();

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  //late Map<DateTime, List<MyEvents>> mySelectedEvents;

  @override
  void initState() {
    //selectedCalendarDate = _focusedCalendarDate;
    //mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        backButton_onClick: () {
          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()),
                        );
        },
        leadingWidth: 33,
        appTitle: BuildAppBarTitleWidget(
          image: ImageManager.calender,
          text: "My Appointments",
        ),
        centerTitle: true,
        hasBackArrow: true,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("  Schedule",style: TextStyle(fontSize: 23,color: Colors.blueAccent),),
            Padding(
              padding: EdgeInsets.only(left: 23,right: 23),
              child: Column(
              children: [
              Card(
              margin: const EdgeInsets.all(8.0),
    elevation: 5.0,
    shape:  RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(10),
    ),
    side: BorderSide( color: AppColors.white, width: 2.0),
    ),
    child: TableCalendar(
      daysOfWeekVisible: false,
    // today's date
    focusedDay: _focusedCalendarDate,
    // earliest possible date
    firstDay: _initialCalendarDate,
    // latest allowed date
    lastDay: _lastCalendarDate,
    // default view when displayed
    calendarFormat: CalendarFormat.month,
    // default is Saturday & Sunday but can be set to any day.
    // instead of day, a number can be mentioned as well.
    weekendDays: const [DateTime.sunday, 6],
    // default is Sunday but can be changed according to locale
    startingDayOfWeek: StartingDayOfWeek.monday,
    // height between the day row and 1st date row, default is 16.0
    daysOfWeekHeight: 40.0,
    // height between the date rows, default is 52.0
    rowHeight: 40.0,
    headerStyle:  HeaderStyle(
      headerPadding: EdgeInsets.symmetric(vertical: 2.0), // Adjust the padding
      formatButtonVisible: false,
    titleTextStyle:
    TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
    decoration: BoxDecoration(
    color: Color(0xFF000080),
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15))),
    formatButtonTextStyle:
    TextStyle(color: Color(0xFFE50000), fontSize: 16.0),
    // formatButtonDecoration: BoxDecoration(
    // color: Color(0xFFFFFFFF),
    // borderRadius: BorderRadius.all(
    // Radius.circular(5.0),
    // ), ),
    leftChevronIcon: Icon(
    Icons.chevron_left,
    color: Color(0xFFFFFFFF),
    size: 28,
    ),
    rightChevronIcon: Icon(
    Icons.chevron_right,
    color: Color(0xFFFFFFFF),
    size: 28,
    ),
    ),
    daysOfWeekStyle: const DaysOfWeekStyle(
    // Weekend days color (Sat,Sun)
    weekendStyle: TextStyle(color: Colors.black,fontSize: 18),
    ),
    // Calendar Dates styling
    calendarStyle: const CalendarStyle(
    // Weekend dates color (Sat & Sun Column)
      outsideTextStyle:TextStyle(color: Colors.grey,fontSize: 20) ,
      defaultTextStyle: TextStyle(fontSize: 20),
    weekendTextStyle: TextStyle(color: Colors.black,fontSize: 20),
    // highlighted color for today
    todayDecoration: BoxDecoration(
    color: Color(0xFF6B5B95),
    shape: BoxShape.circle,
    ),
    // highlighted color for selected day
    selectedDecoration: BoxDecoration(
    color: Color(0xFF3B3024),
    shape: BoxShape.circle,
    ),
    ),
    ),
      ),
      ]
    ),
            ),
            SizedBox(height: 2.h,),
            Center(
              child: Container(
                padding: EdgeInsets.all(3),
                width: 44.h,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Shadow color
                      offset: Offset(0, 3), // Offset in x and y direction
                      blurRadius: 6, // Blur radius
                      spreadRadius: 0, // Spread radius
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width:5.w,),
                    Text("From",style: TextStyle(fontSize: 20,color:  Color(0xFF000080)),),
                    SizedBox(width:19.w,),
                    Text("To",style: TextStyle(fontSize: 20,color:  Color(0xFF000080)),),
                    SizedBox(width:15.w,),
                    Text("Reasons",style: TextStyle(fontSize: 20,color:  Color(0xFF000080)),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            Row(
              children: [
                SizedBox(width: 7.w,),
                Container(
                  padding: EdgeInsets.all(9),
                  width: 85,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("10:00 Am",style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 5.w,),
                Container(
                  padding: EdgeInsets.all(9),
                  width: 85,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("10:30 Am",style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 4.w,),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 105,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("Reservation",style: TextStyle(fontSize: 16,color: Colors.blueAccent),),
                ),
              ],
            ),
            SizedBox(height: 3.h,),
            Row(
              children: [
                SizedBox(width: 7.w,),
                Container(
                  padding: EdgeInsets.all(9),
                  width: 85,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("10:00 Am",style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 5.w,),
                Container(
                  padding: EdgeInsets.all(9),
                  width: 85,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("10:30 Am",style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 4.w,),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 105,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("Reservation",style: TextStyle(fontSize: 16,color: Colors.blueAccent),),
                ),
              ],
            ),
            SizedBox(height: 3.h,),
            Row(
              children: [
                SizedBox(width: 7.w,),
                Container(
                  padding: EdgeInsets.all(9),
                  width: 85,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("10:00 Am",style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 5.w,),
                Container(
                  padding: EdgeInsets.all(9),
                  width: 85,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("10:30 Am",style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 4.w,),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 105,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("Reservation",style: TextStyle(fontSize: 16,color: Colors.blueAccent),),
                ),
              ],
            ),
            SizedBox(height: 3.h,),
            Row(
              children: [
                SizedBox(width: 7.w,),
                Container(
                  padding: EdgeInsets.all(9),
                  width: 85,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("10:00 Am",style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 5.w,),
                Container(
                  padding: EdgeInsets.all(9),
                  width: 85,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("10:30 Am",style: TextStyle(fontSize: 15),),
                ),
                SizedBox(width: 4.w,),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 105,
                  height:43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 3), // Offset in x and y direction
                        blurRadius: 6, // Blur radius
                        spreadRadius: 0, // Spread radius
                      ),
                    ],
                  ),
                  child: Text("Reservation",style: TextStyle(fontSize: 16,color: Colors.blueAccent),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}