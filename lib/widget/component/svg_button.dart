import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final void Function() onTap;

  const SvgButton({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: SvgPicture.asset(imageUrl),
      ),
    );
  }
}
