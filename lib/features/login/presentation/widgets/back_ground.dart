import 'package:doctor_final/core/uitls/app_colors.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Widget screen;
  final bool isContainAppBar;
  const BackGround({
    Key? key,
    required this.screen,
    this.isContainAppBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ClipPath(
        //   clipper: isContainAppBar ? TriangleClipperr2() : TriangleClipperr(),
        //   child: Container(
        //     color: AppConstants.isCurrentThemeDark
        //         ? AppColors.darkGery
        //         : AppColors.lightGery,
        //   ),
        // ),
        screen,
      ],
    );
  }
}

class TriangleClipperr extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.9, size.height * 0.53);
    path.lineTo(0, size.height * 0.05);
    path.lineTo(0, size.height * 0.95);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipperr oldClipper) => false;
}

class TriangleClipperr2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.9, size.height * 0.53);
    path.lineTo(0, size.height * 0.01);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipperr2 oldClipper) => false;
}
