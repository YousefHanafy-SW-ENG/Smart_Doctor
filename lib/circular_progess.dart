import 'package:flutter/material.dart';

import '../../core/uitls/app_colors.dart';

class My_circular_progress extends StatelessWidget {
  const My_circular_progress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.blue,
        strokeWidth: 10,
        backgroundColor: AppColors.white,
      ),
    );
  }
}