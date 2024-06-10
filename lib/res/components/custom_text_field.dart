import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final IconData? icon;
  const CustomTextField({
    super.key,
    this.controller,
    required this.hint,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles.blackSmallText,
      cursorColor: AppColors.yellowColor,
      decoration: InputDecoration(
          isDense: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.whiteColor,
          filled: true,
          hintText: hint,
          hintStyle: TextStyles.hintText,
          prefixIcon: icon == null
              ? null
              : Icon(
                  icon,
                  color: Colors.grey,
                )),
    );
  }
}
