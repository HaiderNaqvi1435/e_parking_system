import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

CircularProgressIndicator buildProgressIndicator() {
    return const CircularProgressIndicator(
            color: AppColors.whiteColor,
            strokeWidth: 2,
          );
  }