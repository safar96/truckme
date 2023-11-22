import 'package:flutter/material.dart';
import 'package:truckme/core/component/size_config.dart';

class TextWithRight extends StatefulWidget {
  final String title;

  const TextWithRight({super.key, required this.title});

  @override
  State<TextWithRight> createState() => _TextWithRightState();
}

class _TextWithRightState extends State<TextWithRight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getConfigWidth(1),
      height: getConfigHeight(0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title ,
          style: TextStyle(
            fontSize: 16
          ),
            ),
          Container(
            width: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/right.png",
                ),
                scale: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
