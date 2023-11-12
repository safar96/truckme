import 'package:flutter/material.dart';

class OutButton extends StatefulWidget {
  final double height;
  final double width;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Function() onTap;

  const OutButton({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.onTap,
    required this.titleColor,
    required this.backgroundColor,
  });

  @override
  State<OutButton> createState() => _OutButtonState();
}

class _OutButtonState extends State<OutButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              color: widget.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
