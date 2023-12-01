import 'package:flutter/material.dart';

import '../../core/component/size_config.dart';
import '../../widget/component/back_button_custom.dart';

class SupportP extends StatefulWidget {
  const SupportP({super.key});

  @override
  State<SupportP> createState() => _SupportPState();
}

class _SupportPState extends State<SupportP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Container(
          margin:const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: BackButtonCustom(
            height: getConfigHeight(0.05),
            width: getConfigWidth(0.15),
          ),
        ),
        title: const Text(
          "Qo'llab quvvatlash",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: Text(
        'Support',
        textAlign: TextAlign.center,
      ),
    );
  }
}
