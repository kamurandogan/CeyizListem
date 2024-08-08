import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';

final class ApplicationInit {
  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(
      _initializeApp,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  Future<void> _initializeApp() async {
    MobileAds.instance.initialize();
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
        testDeviceIds: ['B3EEABB8EE11C2BE770B684D95219ECB'], // Test cihaz kimliğinizi buraya ekleyin
      ),
    );
    await Firebase.initializeApp();
  }
}
