import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/utils/service locator/service_locator.dart';
import 'myApp.dart';
void main() {
  initServiceLocator();
  runApp(  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ),
  );
}

