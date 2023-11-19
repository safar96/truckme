import 'package:flutter/material.dart';

class DirectionCard extends StatefulWidget {
  final double height;
  final double width;
  final String imageUrl;
  final String title;
  final Function() onTap;

  const DirectionCard({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  State<DirectionCard> createState() => _DirectionCardState();
}

class _DirectionCardState extends State<DirectionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF97ADB6).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: const Color(0xFF97ADB6).withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.imageUrl,
                  ),
                  scale: 1.8,
                ),
              ),
            ),
            Container(
              height: widget.height * 0.3,
              width: widget.width,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.title,
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
