import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  final Function() onTap;

  const IconButtonCustom({
    super.key,
    required this.height,
    required this.width,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(url),
            scale: 3.5,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
