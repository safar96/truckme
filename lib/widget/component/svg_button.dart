import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as hh;

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
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: hh.Svg(
              imageUrl,
              // size: Size(width, height),
            ),
          ),
        ),
      ),
    );
  }
}
