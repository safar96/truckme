import 'package:flutter/material.dart';
import 'package:truckme/core/app_data/constants.dart';

import '../../core/component/size_config.dart';

class SplashP extends StatefulWidget {
  const SplashP({super.key});

  @override
  State<SplashP> createState() => _SplashPState();
}

class _SplashPState extends State<SplashP> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed("/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Container(
        height: getConfigFullHeight(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
