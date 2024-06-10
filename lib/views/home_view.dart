import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/res/components/custom_text_button.dart';
import 'package:e_parking_system/res/components/dashboard_button/dashboard_button.dart';
import 'package:e_parking_system/res/routes/route_name.dart';
import 'package:e_parking_system/services/notification_services.dart';
import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:e_parking_system/viewmodels/slot_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/widgets/my_app_bar.dart';
import '../viewmodels/auth_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final authController = Get.find<AuthViewModel>();
  final svm = Get.find<SlotViewmodel>();
  final noti = NotificationService();

  @override
  void initState() {
    noti.initNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              decoration: const BoxDecoration(color: AppColors.darkColor),
              child: Row(
                children: [
                  const Expanded(
                    child: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      radius: 25,
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                  ),
                  Obx(
                    () => Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Text(
                            authController.currentUser.value.name ?? "",
                            style: TextStyles.whiteMediumHeading,
                          ),
                          subtitle: Text(
                            authController.currentUser.value.email ?? "",
                            style: TextStyles.whiteSmallText,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: ConstSize.hvP1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextButton(
                      onTap: () {},
                      text: "Parking history",
                    ),
                    const SizedBox(height: ConstSize.size1),
                    CustomTextButton(
                        onTap: () => Get.toNamed(RouteName.myBookingView),
                        text: "My Bookings"),
                    Divider(
                      height: 30,
                      color: Colors.grey.shade400,
                    ),
                    CustomTextButton(
                      onTap: () {},
                      text: "My account",
                    ),
                    const SizedBox(height: ConstSize.size1),
                    CustomTextButton(
                      onTap: () {},
                      text: "Payment method",
                    ),
                    Divider(
                      height: 30,
                      color: Colors.grey.shade400,
                    ),
                    CustomTextButton(
                      onTap: () {
                        Get.toNamed(RouteName.myVehicleView);
                      },
                      text: "My vehicle",
                    ),
                    const SizedBox(height: ConstSize.size1),
                    CustomTextButton(
                      onTap: () {
                        Get.toNamed(RouteName.addVehicleView);
                      },
                      text: "Add Vehicle",
                    ),
                    Divider(
                      height: 30,
                      color: Colors.grey.shade400,
                    ),
                    CustomTextButton(
                      onTap: () {},
                      text: "Support",
                    ),
                    const SizedBox(height: ConstSize.size1),
                    CustomTextButton(
                      onTap: () {},
                      text: "Contact",
                    ),
                    Divider(
                      height: 30,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: ConstSize.hvP1,
              child: Column(
                children: [
                  CustomTextButton(
                    onTap: () {},
                    text: "Settings",
                  ),
                  const SizedBox(height: ConstSize.size1),
                  CustomTextButton(
                    onTap: () => authController.logout(),
                    text: "Logout",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: myAppBar("Home"),
      body: Padding(
        padding: ConstSize.hVP2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              children: [
                DashboardButton(
                    onPressed: () {
                      Get.toNamed(RouteName.selectLocationView);
                      svm.isCarView(true);

                      svm.filterList();
                    },
                    imageAsset: 'assets/icons/car.png',
                    title: 'Car Park'),
                DashboardButton(
                    onPressed: () async {
                      Get.toNamed(RouteName.selectLocationView);
                      svm.isCarView(false);
                      svm.filterList();
                    },
                    imageAsset: 'assets/icons/motorcycle.png',
                    title: 'Bike Park'),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
