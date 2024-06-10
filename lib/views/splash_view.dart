import 'dart:async';

import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/res/routes/route_name.dart';
import 'package:e_parking_system/services/shared_prefs_services.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/widgets/build_app_icon.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      checkLoginSession();
    });
  }

  checkLoginSession() async {
    final bool isFirstTime = await SharedPrefsHelper.isFirstTime();
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offNamed(RouteName.homeView);
    } else {
      if (isFirstTime == true) {
        Get.offNamed(RouteName.onboardingView);
      } else {
        Get.offNamed(RouteName.loginView);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAppIcon(),
            const SizedBox(height: ConstSize.size2),
            const Text("E Parking System", style: TextStyles.darkSmallHeading)
          ],
        ),
      ),
    );
  }
}
