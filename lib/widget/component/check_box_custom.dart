import 'package:flutter/material.dart';
import 'package:truckme/core/app_data/constants.dart';

class CheckBoxCustom extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final bool isSelected;
  final Function() onTap;

  const CheckBoxCustom({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          children: [
            isSelected
                ? Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 6,
                        color: Constants.primaryColor,
                      ),
                    ),
                  )
                : Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: Constants.dividerColor,
                      ),
                    ),
                  ),
            SizedBox(
              width: width - 25,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF3E4958),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
