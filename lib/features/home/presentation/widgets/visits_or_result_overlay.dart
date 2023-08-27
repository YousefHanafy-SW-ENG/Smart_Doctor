// import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
// import 'package:doctor_final/config/routes/app_routes.dart';
// import 'package:doctor_final/core/uitls/app_colors.dart';
// import 'package:doctor_final/core/uitls/constants.dart';
// import 'package:doctor_final/core/uitls/media_query_values.dart';
// import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
// import 'package:flutter/material.dart';

// OverlayEntry? overlayEntry;

// void visitsOrResultOverlay({
//   required BuildContext context,
//   required List<String> items,
// }) async {
//   ShowResultCubit().getCubit(context).overLayWidgetIsOpen = true;
//   OverlayState? overlayState = Overlay.of(context);

//   overlayEntry = OverlayEntry(builder: (context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomRadioButton(
//               buttonTextStyle: ButtonTextStyle(
//                 textStyle: const TextStyle(fontSize: 20),
//                 unSelectedColor: AppConstants.isCurrentThemeDark
//                     ? AppColors.white
//                     : AppColors.lightBlack,
//               ),
//               unSelectedBorderColor: AppConstants.isCurrentThemeDark
//                   ? AppColors.lightBlack
//                   : AppColors.white,
//               selectedColor: AppColors.primaryColor,
//               selectedBorderColor: AppColors.primaryColor,
//               enableShape: true,
//               shapeRadius: 15,
//               elevation: 0,
//               defaultSelected: items[0],
//               margin: EdgeInsets.zero,
//               padding: 0,
//               height: context.height * 0.08,
//               unSelectedColor: AppConstants.isCurrentThemeDark
//                   ? AppColors.lightBlack
//                   : AppColors.white,
//               horizontal: true,
//               buttonLables: items,
//               buttonValues: items,
//               radioButtonValue: (value) {
//                 if (value == 'Per Visit' || value == 'لكل زيارة') {
//                   Navigator.pushNamed(context, Routes.visitScreen);
//                 } else {
//                   Navigator.pushNamed(context, Routes.showResultScreen);
//                 }
//                 closeVisitsOrResultOverlay(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   });

//   overlayState.insert(overlayEntry!);
// }

// // void closeVisitsOrResultOverlay(context) {
// //   if (ShowResultCubit().getCubit(context).overLayWidgetIsOpen) {
// //     overlayEntry!.remove();
// //     ShowResultCubit().getCubit(context).overLayWidgetIsOpen = false;
// //   }
// // }
