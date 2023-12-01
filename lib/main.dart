import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckme/page/auth/login_p.dart';
import 'package:truckme/page/auth/registration_p.dart';
import 'package:truckme/page/auth/sms_confirm_p.dart';
import 'package:truckme/page/auth/splash_p.dart';
import 'package:truckme/page/drawer/travel_details_p.dart';
import 'package:truckme/page/drawer/travel_history_p.dart';
import 'package:truckme/page/main/announcement_p.dart';
import 'package:truckme/page/main/main_new.dart';
import 'package:truckme/page/main/main_p.dart';
import 'package:truckme/page/main/delivery_map_p.dart';
import 'package:truckme/page/main/request_seccess_p.dart';
import 'package:truckme/page/main/special_auto_map_p.dart';
import 'package:truckme/page/main/special_auto_request_p.dart';
import 'package:truckme/provider/auth_provider.dart';

import 'core/language/language_selection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Locale locale = await getLocal();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('uz', 'UZB'),
        Locale('ru', 'RU'),
        Locale('en', 'EN'),
      ],
      fallbackLocale: const Locale('uz', 'UZB'),
      startLocale: locale,
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'TruckMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainNew(),
      routes: {
        // "/first": (BuildContext context) => const FirstPage(),
        "/login": (BuildContext context) => const LoginP(),
        "/registration": (BuildContext context) => const RegistrationP(),
        // "/main-page": (BuildContext context) => const MainPage(),
      },
    );
  }
}



//flutter build apk --split-per-abi
