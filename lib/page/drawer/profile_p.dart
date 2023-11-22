import 'package:flutter/material.dart';

import '../../core/component/size_config.dart';
import '../../widget/component/back_button_custom.dart';

class ProfileP extends StatefulWidget {
  const ProfileP({super.key});

  @override
  State<ProfileP> createState() => _ProfilePState();
}

class _ProfilePState extends State<ProfileP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: BackButtonCustom(
            height: getConfigHeight(0.05),
            width: getConfigWidth(0.15),
          ),
        ),
      ),
    );
  }
}
