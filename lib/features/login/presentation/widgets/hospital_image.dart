import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/uitls/image_manager.dart';

class HospitalImage extends StatelessWidget {
  const HospitalImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      // alignment: AlignmentDirectional.center,
      child: SizedBox(
        // height: 80.h,
        width: 55.w,
        child: Image.asset(
          ImageManager.hospital,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
