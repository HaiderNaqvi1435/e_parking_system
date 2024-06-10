import 'dart:async';

import 'package:e_parking_system/data/locations.dart';
import 'package:e_parking_system/res/widgets/my_app_bar.dart';
import 'package:e_parking_system/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../res/widgets/review_bottomsheet.dart';
import '../viewmodels/slot_viewmodel.dart';

class ReciptView extends StatefulWidget {
  const ReciptView({super.key});

  @override
  State<ReciptView> createState() => _ReciptViewState();
}

class _ReciptViewState extends State<ReciptView> {
  final auth = Get.find<AuthViewModel>();
  final svm = Get.find<SlotViewmodel>();
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => showReviewBottomSheet(context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Recipt"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: QrImageView(
              
                data: '1234567890',
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoRow('Name', auth.currentUser.value.name ?? ""),
            _buildInfoRow('Email', auth.currentUser.value.email ?? ""),
            _buildInfoRow('Phone', auth.currentUser.value.phone ?? ""),
            _buildInfoRow('Slot ID', svm.slot.value.slotNo ?? ""),
            _buildInfoRow('Booking ID', svm.slot.value.slotId ?? ""),
            _buildInfoRow(
                'Booking time', "${svm.slot.value.timeInHours} Hours"),
            _buildInfoRow(
                'Vehicle no', svm.slot.value.vehicle!.vehicleNo ?? ""),
            _buildInfoRow('Total amount', svm.slot.value.totalPrice.toString()),
            _buildInfoRow('Parking Address', Locations.location.address ?? ""),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
