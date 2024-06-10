import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

AppBar myAppBar(String title) {
    return AppBar(
      backgroundColor: AppColors.darkColor,
      iconTheme: const IconThemeData(color: AppColors.yellowColor),
      centerTitle: true,
      elevation: 5,
      title:  Text(
        title,
        style: TextStyles.whiteMediumHeading,
      ),
      
    );
  }