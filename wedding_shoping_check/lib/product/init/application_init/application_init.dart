import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
        testDeviceIds: [dotenv.env['TEST_DEVICE_ID']!], // Test cihaz kimliğinizi buraya ekleyin
      ),
    );
    await Firebase.initializeApp();
  }
}
