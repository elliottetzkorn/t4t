import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:t4t/constants.dart';

class DeviceUtils {
  DeviceUtils._();

  static bool? isTabletNullable;

  static Future<void> setIsTablet() async {
    if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      if (iosInfo.model.toLowerCase() == 'ipad') {
        isTabletNullable = true;
      } else {
        isTabletNullable = false;
      }
    }
  }

  static bool isTablet(BuildContext context) {
    if (isTabletNullable != null) {
      return isTabletNullable!;
    }

    try {
      return MediaQuery.of(context).size.shortestSide > tabletWidth;
    } catch (error) {
      return false;
    }
  }
}
