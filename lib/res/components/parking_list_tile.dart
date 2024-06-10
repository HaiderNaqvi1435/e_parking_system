import 'package:e_parking_system/res/colors/app_colors.dart';
import 'package:e_parking_system/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class ParkingListTile extends StatelessWidget {
  const ParkingListTile({
    super.key,
    required this.title,
    required this.address,
    required this.price,
    this.onTap,
  });
  final String title;
  final String address;
  final String price;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.whiteColor,
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(
          'assets/icons/parkingloc.png',
        ),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.darkColor),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address,
              style: TextStyles.darkSmallText,
            ),
            Text(
              price,
              style: TextStyles.redExtraSmallText,
            ),
          ],
        ),
      ),
    );
  }
}
