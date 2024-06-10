import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/res/components/large_button.dart';
import 'package:e_parking_system/res/routes/route_name.dart';
import 'package:e_parking_system/services/shared_prefs_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage =
                    index == 2; // Change this based on the number of pages
              });
            },
            children: [
              buildPage(
                color: Colors.blue,
                imageAsset: 'assets/icons/parking-area.png',
                title: 'Welcome to E-Parking',
                description: 'Find and book parking spots easily.',
              ),
              buildPage(
                color: Colors.green,
                imageAsset: 'assets/icons/pin.png',
                title: 'Easy Navigation',
                description: 'Navigate to your parking spot with ease.',
              ),
              buildPage(
                color: Colors.red,
                imageAsset: 'assets/icons/payment-method.png',
                title: 'Secure Payments',
                description: 'Pay securely using our app.',
              ),
            ],
          ),
          Positioned(
            bottom: 30.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3, // Number of pages
                  effect: const WormEffect(
                    activeDotColor: AppColors.yellowColor,
                    dotColor: Colors.grey,
                    dotHeight: 12.0,
                    dotWidth: 12.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                isLastPage
                    ? LargeButton(
                        onPressed: () {
                          SharedPrefsHelper.setFirstTime(false);
                          Get.offNamed(RouteName.loginView);
                        },
                        title: 'Get Started',
                      )
                    : LargeButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        title: 'Next',
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required Color color,
    required String imageAsset,
    required String title,
    required String description,
  }) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAsset, height: 300.0),
          const SizedBox(height: 40.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
