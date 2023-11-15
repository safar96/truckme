import 'package:flutter/material.dart';

class CardWithRight extends StatefulWidget {
  final double height;
  final double width;
  final String title;
  final String imageUrl;
  final Function() onTap;

  const CardWithRight({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.onTap,
    required this.imageUrl,
  });

  @override
  State<CardWithRight> createState() => _CardWithRightState();
}

class _CardWithRightState extends State<CardWithRight> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: const BoxDecoration(
          color: Color(0xFFF7F8F9),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: widget.width * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.imageUrl,
                  ),
                  scale: 3,
                ),
              ),
            ),
            SizedBox(
              width: widget.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(fontSize: 20, color: Color(0xFF3E4958)),
                ),
              ),
            ),
            Container(
              width: widget.width * 0.2,
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
      ),
    );
  }
}
