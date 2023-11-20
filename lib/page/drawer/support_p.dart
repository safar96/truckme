import 'package:flutter/material.dart';

class SupportP extends StatefulWidget {
  const SupportP({super.key});

  @override
  State<SupportP> createState() => _SupportPState();
}

class _SupportPState extends State<SupportP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Support',
        textAlign: TextAlign.center,
      ),
    );
  }
}
