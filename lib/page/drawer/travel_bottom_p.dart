import 'package:flutter/material.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/widget/component/text_with_right.dart';

class TravelBottomP extends StatefulWidget {
  const TravelBottomP({super.key});

  @override
  State<TravelBottomP> createState() => _TravelBottomPState();
}

class _TravelBottomPState extends State<TravelBottomP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getConfigHeight(0.5),
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Variantni tanlang",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: getConfigHeight(0.04),),
          for (var i = 0; i < 5; i++)
           Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: const Column(
                    children: [
                       TextWithRight( title: 'Men bir narsani qoldirdim',),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                    ],
                  ),
            ),
        ],
      ),
    );
  }
}
