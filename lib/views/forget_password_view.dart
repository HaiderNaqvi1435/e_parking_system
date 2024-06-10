import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/colors/app_colors.dart';
import '../res/components/custom_text_button.dart';
import '../res/components/custom_text_field.dart';
import '../res/components/large_button.dart';
import '../res/routes/route_name.dart';
import '../res/widgets/build_app_icon.dart';
import '../utils/const_size/const_size.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: Center(
        child: Padding(
          padding: ConstSize.hP2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildAppIcon(),
              const SizedBox(height: ConstSize.size4),
              const CustomTextField(
                hint: "Email",
                icon: Icons.person,
              ),
              const SizedBox(height: ConstSize.size3),
              LargeButton(title: "Send Email", onPressed: () {}),
              const SizedBox(height: ConstSize.size1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    text: "Login",
                    onTap: () {
                      Get.toNamed(RouteName.loginView);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
