import 'package:e_parking_system/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/colors/app_colors.dart';
import '../res/components/custom_text_button.dart';
import '../res/components/custom_text_field.dart';
import '../res/components/large_button.dart';
import '../res/routes/route_name.dart';
import '../res/widgets/build_app_icon.dart';
import '../utils/const_size/const_size.dart';

class SingupView extends StatefulWidget {
  const SingupView({super.key});

  @override
  State<SingupView> createState() => _SingupViewState();
}

class _SingupViewState extends State<SingupView> {
  final authController = Get.find<AuthViewModel>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
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
                controller: nameController,
                hint: "Name",
                icon: Icons.person,
              ),
              const SizedBox(height: ConstSize.size1),
              CustomTextField(
                controller: emailController,
                hint: "Email",
                icon: Icons.email,
              ),
              const SizedBox(height: ConstSize.size1),
              CustomTextField(
                controller: passwordController,
                hint: "Password",
                icon: Icons.password,
              ),
               const SizedBox(height: ConstSize.size1),
              CustomTextField(
                controller: phoneController,
                hint: "Phone",
                icon: Icons.phone,
              ),
              const SizedBox(height: ConstSize.size1),
              CustomTextField(
                controller: addressController,
                hint: "Address",
                icon: Icons.location_city,
              ),
              const SizedBox(height: ConstSize.size3),
              Obx(()=>
                 LargeButton(
                  isLoading: authController.isLoading.value,
                  title: "Sign up",
                  onPressed: () => authController.signup(
                    emailController.text,
                    passwordController.text,
                    nameController.text,
                    phoneController.text,
                    addressController.text,
                  ),
                ),
              ),
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
