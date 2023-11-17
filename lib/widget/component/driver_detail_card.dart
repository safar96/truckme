import 'package:flutter/material.dart';
import 'package:truckme/core/component/size_config.dart';

class DriverDetailCard extends StatefulWidget {
  final String imageUrl;
  final String title;

  const DriverDetailCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  State<DriverDetailCard> createState() => _DriverDetailCardState();
}

class _DriverDetailCardState extends State<DriverDetailCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      alignment: Alignment.center,
      width: getConfigWidth(0.27),
      height: getConfigHeight(0.085),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius:const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            widget.imageUrl,
            width: getConfigWidth(0.08),
            height: getConfigHeight(0.035),
            fit: BoxFit.fill,
          ),
          Text(widget.title,style: TextStyle(
            fontSize: 16,
          ),),
        ],
      ),
    );
  }
}
