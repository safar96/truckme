import 'package:flutter/material.dart';
import 'package:truckme/page/auth/language_p.dart';
import 'package:truckme/page/auth/login_p.dart';
import 'package:truckme/page/auth/registration_p.dart';
import 'package:truckme/page/auth/sms_confirm_p.dart';
import 'package:truckme/page/auth/splash_p.dart';
import 'package:truckme/page/main/delivery_request_p.dart';
import 'package:truckme/page/main/main_p.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TruckMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DeliveryRequestP(),
      routes: {
        // "/first": (BuildContext context) => const FirstPage(),
        "/login": (BuildContext context) => const LoginP(),
        "/registration": (BuildContext context) => const RegistrationP(),
        // "/main-page": (BuildContext context) => const MainPage(),
      },
    );
  }
}

