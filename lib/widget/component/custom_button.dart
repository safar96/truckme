import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double radius;
  final String name;
  final double textSize;
  final Color? textColor;
  final Color colorButton;
  final void Function() onTap;

  const CustomButton({
    Key? key,
    required this.radius,
    required this.name,
    required this.textSize,
    required this.textColor,
    required this.onTap,
    required this.colorButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: colorButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: const BorderSide(color: Colors.transparent),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
        ),
      ),
    );
  }
}
