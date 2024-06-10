import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final String imageAsset;
  final String title;
  final VoidCallback? onPressed;
  const DashboardButton({
    super.key,
    required this.imageAsset,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // height: 140,
        // width: 150,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(color: AppColors.darkColor, width: 1.5),
            bottom: BorderSide(color: AppColors.darkColor, width: 1.5),
            left: BorderSide(color: AppColors.darkColor, width: 1.5),
            right: BorderSide(color: AppColors.darkColor, width: 1.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset,
                fit: BoxFit.fill,
                height: 60,
              ),
              const SizedBox(height: ConstSize.size1),
              Text(
                title,
                style: TextStyles.darkSmallHeading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
