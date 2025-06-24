import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sahte/core/di/di.dart';
import 'package:sahte/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupService();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', "US"),
        Locale('ar', "AE"),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', "US"),
      startLocale: const Locale('en', "US"),
      child: const MyApp(),
    ),
  );
}
