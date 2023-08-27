import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/app_strings.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:flutter/material.dart';

class BuildFiltrationBar extends StatelessWidget {
  final String firstFilter;
  final String secoundFilter;
  final String thirdFilter;
  final VoidCallback firstFilterPress;
  final VoidCallback secoundFilterPress;
  final VoidCallback thirdFilterPress;
  final bool isVisitScreen;

  const BuildFiltrationBar({
    Key? key,
    required this.firstFilter,
    required this.secoundFilter,
    required this.thirdFilter,
    required this.firstFilterPress,
    required this.secoundFilterPress,
    required this.thirdFilterPress,
    required this.isVisitScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          )
        ],
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: context.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.red[700],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Filter',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: AppColors.hintColor,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: firstFilterPress,
              child: Text(
                'ID',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: secoundFilterPress,
              child: Text(
                'A:Z',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          if (!isVisitScreen)
            Expanded(
              child: TextButton(
                onPressed: thirdFilterPress,
                child: Text(
                  'Type',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          Expanded(
            child: TextButton(
              onPressed: thirdFilterPress,
              child: Text('Visit date',
                  style:
                      TextStyle(fontSize: 11.9, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildFiltrationBar1 extends StatelessWidget {
  final String firstFilter;
  final String secoundFilter;
  final String thirdFilter;
  final VoidCallback firstFilterPress;
  final VoidCallback secoundFilterPress;
  final VoidCallback thirdFilterPress;
  final bool isVisitScreen;

  const BuildFiltrationBar1({
    Key? key,
    required this.firstFilter,
    required this.secoundFilter,
    required this.thirdFilter,
    required this.firstFilterPress,
    required this.secoundFilterPress,
    required this.thirdFilterPress,
    required this.isVisitScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          )
        ],
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: context.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              color: Colors.blue[300],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Filter',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: AppColors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: firstFilterPress,
              child: Text(
                'Date',
                style: TextStyle(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: secoundFilterPress,
              child: Text(
                'Type',
                style: TextStyle(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (!isVisitScreen)
            Expanded(
              child: TextButton(
                onPressed: thirdFilterPress,
                child: Text(
                  'Test Name',
                  style: TextStyle(
                      color: Colors.red[700], fontWeight: FontWeight.bold),
                ),
              ),
            ),
          // Expanded(
          //   child: TextButton(
          //     onPressed: thirdFilterPress,
          //     child: Text(
          //         'Visit date',
          //         style:TextStyle(fontSize: 11.9,fontWeight: FontWeight.bold)
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class BuildFiltrationBar2 extends StatelessWidget {
  final String firstFilter;
  final String secoundFilter;
  final String thirdFilter;
  final VoidCallback firstFilterPress;
  final VoidCallback secoundFilterPress;
  final VoidCallback thirdFilterPress;
  final bool isVisitScreen;

  const BuildFiltrationBar2({
    Key? key,
    required this.firstFilter,
    required this.secoundFilter,
    required this.thirdFilter,
    required this.firstFilterPress,
    required this.secoundFilterPress,
    required this.thirdFilterPress,
    required this.isVisitScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          )
        ],
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: context.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[300],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Filter',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: AppColors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: firstFilterPress,
              child: Text(
                'Date',
                style: TextStyle(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: secoundFilterPress,
              child: Text(
                'Type',
                style: TextStyle(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (!isVisitScreen)
            Expanded(
              child: TextButton(
                onPressed: thirdFilterPress,
                child: Text(
                  'Clinic Name',
                  style: TextStyle(
                      color: Colors.red[700], fontWeight: FontWeight.bold),
                ),
              ),
            ),
          // Expanded(
          //   child: TextButton(
          //     onPressed: thirdFilterPress,
          //     child: Text(
          //         'Visit date',
          //         style:TextStyle(fontSize: 11.9,fontWeight: FontWeight.bold)
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class BuildFiltrationBar3 extends StatelessWidget {
  final String firstFilter;
  final String secoundFilter;
  final String thirdFilter;
  final VoidCallback firstFilterPress;
  final VoidCallback secoundFilterPress;
  final VoidCallback thirdFilterPress;
  final bool isVisitScreen;

  const BuildFiltrationBar3({
    Key? key,
    required this.firstFilter,
    required this.secoundFilter,
    required this.thirdFilter,
    required this.firstFilterPress,
    required this.secoundFilterPress,
    required this.thirdFilterPress,
    required this.isVisitScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          )
        ],
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: context.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              color: Colors.blue[300],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Filter',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: AppColors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: firstFilterPress,
              child: Text(
                firstFilter,
                style: TextStyle(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: secoundFilterPress,
              child: Text(
                '',
                style: TextStyle(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (!isVisitScreen)
            Expanded(
              child: TextButton(
                onPressed: thirdFilterPress,
                child: Text(
                  'Visit No',
                  style: TextStyle(
                      color: Colors.red[700], fontWeight: FontWeight.bold),
                ),
              ),
            ),
          // Expanded(
          //   child: TextButton(
          //     onPressed: thirdFilterPress,
          //     child: Text(
          //         'Visit date',
          //         style:TextStyle(fontSize: 11.9,fontWeight: FontWeight.bold)
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class BuildFiltrationBar4 extends StatelessWidget {
  final String sortText;
  final String firstFilter;
  final String secoundFilter;
  final String thirdFilter;
  final VoidCallback firstFilterPress;
  final VoidCallback secoundFilterPress;
  final VoidCallback thirdFilterPress;
  final VoidCallback? fourthFilterPress;
  final bool isVisitScreen;

  const BuildFiltrationBar4(
      {Key? key,
      required this.sortText,
      required this.firstFilter,
      required this.secoundFilter,
      required this.thirdFilter,
      required this.firstFilterPress,
      required this.secoundFilterPress,
      required this.thirdFilterPress,
      required this.isVisitScreen,
      this.fourthFilterPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          )
        ],
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: context.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.red[700],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Filter',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: AppColors.hintColor,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: firstFilterPress,
              child: Text(
                'ID',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: secoundFilterPress,
              child: Text(
                sortText,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          if (!isVisitScreen)
            Expanded(
              child: TextButton(
                onPressed: thirdFilterPress,
                child: Text(
                  'Type',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          Expanded(
            child: TextButton(
              onPressed: fourthFilterPress,
              child: Text('Visit date',
                  style:
                      TextStyle(fontSize: 11.9, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
