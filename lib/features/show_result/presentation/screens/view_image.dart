import 'package:doctor_final/features/show_result/presentation/cubit/show_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:photo_view/photo_view.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullScreenWidget(
      child: Center(
        child: Hero(
          tag: "",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: PhotoView(
              imageProvider: AssetImage(ShowResultCubit()
                  .getCubit(context)
                  .radiologyAndReportMainImage),
            ),
          ),
        ),
      ),
    );
  }
}
