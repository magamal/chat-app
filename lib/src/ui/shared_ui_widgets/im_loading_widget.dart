import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class ImLoadingWidget extends StatelessWidget {
  const ImLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      height: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.orange,
        ),
      ),
    );
  }
}
