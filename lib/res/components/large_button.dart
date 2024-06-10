import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/build_progress_indicator.dart';

class LargeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? width;
  const LargeButton({
    super.key,
    required this.title,
    this.width,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.darkColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
              child: isLoading
                  ? buildProgressIndicator()
                  : Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    )),
        ),
      ),
    );
  }
}
