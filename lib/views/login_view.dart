import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/res/components/custom_text_button.dart';
import 'package:e_parking_system/res/components/large_button.dart';
import 'package:e_parking_system/res/routes/route_name.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/components/custom_text_field.dart';
import '../res/widgets/build_app_icon.dart';
import '../viewmodels/auth_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final authController = Get.find<AuthViewModel>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
              CustomTextField(
                controller: emailController,
                hint: "Email",
                icon: Icons.person,
              ),
              const SizedBox(height: ConstSize.size1),
              CustomTextField(
                controller: passwordController,
                hint: "Password",
                icon: Icons.password,
              ),
              const SizedBox(height: ConstSize.size3),
              Obx(
                () => LargeButton(
                    isLoading: authController.isLoading.value,
                    title: "Login",
                    onPressed: () => authController.login(
                        emailController.text, passwordController.text)),
              ),
              const SizedBox(height: ConstSize.size1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextButton(
                    text: "Forget password?",
                    onTap: () {
                      Get.toNamed(RouteName.forgetPasswordView);
                    },
                  ),
                  CustomTextButton(
                    text: "Sign up",
                    onTap: () {
                      Get.toNamed(RouteName.signupView);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
