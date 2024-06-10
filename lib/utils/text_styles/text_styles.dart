import 'package:flutter/material.dart';

import '../../res/colors/app_colors.dart';

class TextStyles {
  static const TextStyle redSmallHeading = TextStyle(
      color: AppColors.redColor, fontWeight: FontWeight.bold, fontSize: 12);
  static const TextStyle whiteSmallHeading = TextStyle(
      color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 12);
  static const TextStyle whiteSmallText =
      TextStyle(color: AppColors.whiteColor, fontSize: 12);
  static const TextStyle whiteMediumHeading = TextStyle(
      color: AppColors.whiteColor, fontWeight: FontWeight.bold, fontSize: 14);
  static const TextStyle darkSmallHeading = TextStyle(
      color: AppColors.darkColor, fontWeight: FontWeight.bold, fontSize: 12);
  static const TextStyle hintText = TextStyle(color: Colors.grey, fontSize: 12);
  static const TextStyle blackSmallText =
      TextStyle(color: AppColors.blackColor, fontSize: 12);
  static const TextStyle darkSmallText =
      TextStyle(color: AppColors.darkColor, fontSize: 12);
  static const TextStyle redExtraSmallText =
      TextStyle(color: AppColors.redColor, fontSize: 9);
  static const TextStyle darkLargeHeading = TextStyle(
      color: AppColors.darkColor, fontSize: 18, fontWeight: FontWeight.bold);
}
