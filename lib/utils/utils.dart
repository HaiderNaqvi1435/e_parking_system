import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Utils {
  static void showSnackBar(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Ok',
          textColor: AppColors.yellowColor,
          onPressed: () {
            // This can be left empty if no action is needed
          },
        ),
      ),
    );
  }
}
