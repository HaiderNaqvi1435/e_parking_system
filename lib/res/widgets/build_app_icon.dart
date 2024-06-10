import 'package:e_parking_system/utils/const_size/const_size.dart';
import 'package:flutter/material.dart';

SizedBox buildAppIcon() {
    return SizedBox(
              height: ConstSize.size10,
              width: ConstSize.size10,
              child: Image.asset(
                'assets/icons/parking.png',
              ));
  }