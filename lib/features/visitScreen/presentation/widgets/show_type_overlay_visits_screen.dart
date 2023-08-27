import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/media_query_values.dart';
import 'package:doctor_final/features/visitScreen/presentation/cubit/visit_screen_cubit.dart';
import 'package:flutter/material.dart';

OverlayEntry? overlayEntry;
void showTypeOverlayVisitsScreen({
  required BuildContext context,
  required List<String> items,
  required String varName,
}) async {
  VisitScreenCubit().getCubit(context).overLayWidgetIsOpen = true;
  OverlayState? overlayState = Overlay.of(context);

  overlayEntry = OverlayEntry(builder: (context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomRadioButton(
            buttonTextStyle: const ButtonTextStyle(
              textStyle: TextStyle(fontSize: 20),
            ),
            unSelectedBorderColor: AppColors.white,
            selectedColor: AppColors.primaryColor,
            selectedBorderColor: AppColors.primaryColor,
            enableShape: true,
            shapeRadius: 15,
            elevation: 0,
            defaultSelected: !items.contains(varName) ? items[0] : varName,
            margin: EdgeInsets.zero,
            padding: 0,
            height: context.height * 0.08,
            unSelectedColor: AppColors.white,
            horizontal: true,
            buttonLables: items,
            buttonValues: items,
            radioButtonValue: (value) {
              VisitScreenCubit()
                  .getCubit(context)
                  .changeTypeController(value: value.toString());
              closeShowTypeOverLay(context);
            },
          ),
        ],
      ),
    );
  });

  overlayState.insert(overlayEntry!);
}

void closeShowTypeOverLay(context) {
  if (VisitScreenCubit().getCubit(context).overLayWidgetIsOpen) {
    overlayEntry!.remove();
    VisitScreenCubit().getCubit(context).overLayWidgetIsOpen = false;
  }
}
