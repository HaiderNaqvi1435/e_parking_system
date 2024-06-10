import 'package:e_parking_system/views/add_vehicle_view.dart';
import 'package:e_parking_system/views/checkout_view.dart';
import 'package:e_parking_system/views/forget_password_view.dart';
import 'package:e_parking_system/views/home_view.dart';
import 'package:e_parking_system/views/login_view.dart';
import 'package:e_parking_system/views/my_booking_view.dart';
import 'package:e_parking_system/views/my_vehicle_view.dart';
import 'package:e_parking_system/views/onboarding_view.dart';
import 'package:e_parking_system/views/recipt_view.dart';
import 'package:e_parking_system/views/select_location_view.dart';
import 'package:e_parking_system/views/select_slot_view.dart';
import 'package:e_parking_system/views/singup_view.dart';
import 'package:get/get.dart';

import '../../views/splash_view.dart';
import 'route_name.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashView,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.signupView,
          page: () => const SingupView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.forgetPasswordView,
          page: () => const ForgetPasswordView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => const HomeView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.selectLocationView,
          page: () => const SelectLocationView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.selectSlotView,
          page: () => const SelectSlotView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.checkoutView,
          page: () => const CheckoutView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.myVehicleView,
          page: () => const MyVehicleView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.addVehicleView,
          page: () => const AddVehicleView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.myBookingView,
          page: () => const MyBookingView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.reciptView,
          page: () => const ReciptView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.onboardingView,
          page: () => const OnboardingView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.fadeIn,
        ),
      ];
}
