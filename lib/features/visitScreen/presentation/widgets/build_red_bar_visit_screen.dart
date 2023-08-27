// import 'package:doctor_final/config/routes/app_routes.dart';
// import 'package:doctor_final/core/uitls/app_colors.dart';
// import 'package:doctor_final/core/uitls/app_strings.dart';
// import 'package:doctor_final/core/uitls/media_query_values.dart';
// import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
// import 'package:doctor_final/features/show_result/presentation/widgets/build_double_virtically_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BuildSingleRedBarVisitScreen extends StatelessWidget {
//   final bool containTwoIcons;
//   final String text;
//   final IconData reportIcon;
//   final VoidCallback showReportImagePress;
//   final VoidCallback showPrescriptionImagePress;
//   final VoidCallback shareToPress;

//   final IconData prescriptionIcon;
//   final String dateText;
//   // final String imageWantToShow;
//   final bool showPrescriptionImage;
//   final bool showReportImage;
//   final prescriptionImage;
//   final reportImage;

//   const BuildSingleRedBarVisitScreen({
//     Key? key,
//     required this.containTwoIcons,
//     required this.prescriptionImage,
//     required this.showPrescriptionImage,
//     required this.showPrescriptionImagePress,
//     required this.reportImage,
//     required this.showReportImage,
//     required this.showReportImagePress,
//     required this.shareToPress,
//     required this.text,
//     required this.prescriptionIcon,
//     required this.reportIcon,
//     required this.dateText,
//     // required this.imageWantToShow,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ShowResultCubit myCubit = ShowResultCubit().getCubit(context);

//     return BlocConsumer<ShowResultCubit, ShowResultState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: context.height * 0.02,
//                   left: context.width * 0.01,
//                   right: context.width * 0.01,
//                   // bottom: context.height * 0.02,
//                 ),
//                 child: Container(
//                   constraints: BoxConstraints(minHeight: context.height * 0.09),
//                   decoration: BoxDecoration(
//                     color: AppColors.primaryColor,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: context.height * 0.02,
//                           bottom: context.height * 0.02,
//                           left: context.width * 0.01,
//                           right: context.width * 0.02,
//                         ),
//                         child: Row(
//                           children: [
//                             //share to widget

//                             Expanded(
//                               child: BuildDoubleVirticallyWidget(
//                                 icon: Icons.ios_share_outlined,
//                                 text: AppStrings.shareTo,
//                               ),
//                             ),

//                             // show report image and close the other image
//                             if (containTwoIcons)
//                               Expanded(
//                                 child: InkWell(
//                                     onTap: showReportImagePress,
//                                     child: BuildDoubleVirticallyWidget(
//                                       icon: reportIcon,
//                                       text: AppStrings.showReport,
//                                     )),
//                               ),

//                             // show prescription image and close the other image
//                             Expanded(
//                               child: InkWell(
//                                 onTap: showPrescriptionImagePress,
//                                 child: BuildDoubleVirticallyWidget(
//                                   icon: prescriptionIcon,
//                                   text: AppStrings.showImage,
//                                 ),
//                               ),
//                             ),

//                             // // left Text

//                             // right text
//                             Expanded(
//                               flex: 2,
//                               child: Text(
//                                 text,
//                                 maxLines: 5,
//                                 textAlign: TextAlign.center,
//                                 // overflow: TextOverflow.ellipsis,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline1!
//                                     .copyWith(
//                                         color: AppColors.white, fontSize: 12),
//                               ),
//                             ),
//                             SizedBox(
//                               width: context.width * 0.01,
//                             ),
//                             // date Text
//                             SizedBox(
//                               width: context.width * 0.185,
//                               child: Text(
//                                 dateText,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline1!
//                                     .copyWith(
//                                       color: AppColors.white,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (showPrescriptionImage)
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               Routes.viewImage,
//                             );
//                           },
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                               left: context.width * 0.01,
//                               right: context.width * 0.01,
//                             ),
//                             child: Container(
//                               height: context.height * 0.43,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage(prescriptionImage),
//                                   fit: BoxFit.fill,
//                                 ),
//                                 border: Border.all(
//                                   width: 3,
//                                   color: AppColors.primaryColor,
//                                 ),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                           ),
//                         ),

//                       // reportImage
//                       if (showReportImage)
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               Routes.viewImage,
//                             );
//                           },
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                               left: context.width * 0.01,
//                               right: context.width * 0.01,
//                             ),
//                             child: Container(
//                               height: context.height * 0.43,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage(reportImage),
//                                   fit: BoxFit.fill,
//                                 ),
//                                 border: Border.all(
//                                   width: 3,
//                                   color: AppColors.primaryColor,
//                                 ),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
