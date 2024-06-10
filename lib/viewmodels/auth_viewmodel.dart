import 'package:e_parking_system/models/user_model.dart';
import 'package:e_parking_system/res/routes/route_name.dart';
import 'package:e_parking_system/utils/utils.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/firebase/auth_services.dart';

class AuthViewModel extends GetxController {
  Rx<UserModel> currentUser = UserModel().obs;
  @override
  void onInit() async {
    if (FirebaseAuth.instance.currentUser != null) {
      currentUser.value = await AuthService.getUser();
    }
    // TODO: implement onInit
    super.onInit();
  }

  final AuthService _authService = Get.put(AuthService());
  RxBool isLoading = false.obs;
  Future<void> signup(String email, String password, String name, String phone,
      String address) async {
    isLoading(true);
    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        address.isEmpty ||
        phone.isEmpty) {
      Utils.showSnackBar("All fields are required");
      isLoading(false);

      return;
    }
    if (!email.isEmail) {
      Utils.showSnackBar("Invalid email");
      isLoading(false);

      return;
    }
    User? user =
        await _authService.signup(email, password, name, phone, address);
    if (user != null) {
      Utils.showSnackBar("Account created");
      isLoading(false);

      Get.offNamed(RouteName.homeView);
    }
  }

  Future<void> login(String email, String password) async {
    isLoading(true);

    if (email.isEmpty || password.isEmpty) {
      Utils.showSnackBar("All fields are required");
      isLoading(false);

      return;
    }
    if (!email.isEmail) {
      Utils.showSnackBar("Invalid email");
      isLoading(false);

      return;
    }
    User? user = await _authService.login(email, password);
    if (user != null) {
      isLoading(false);
      currentUser.value = await AuthService.getUser();

      Get.offNamed(RouteName.homeView);
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    Utils.showSnackBar("You have been logged");
    Get.offNamed(RouteName.loginView);
  }

  Future<void> resetPassword(String email) async {
    await _authService.resetPassword(email);
  }
}
