import 'package:flutter/material.dart';
import 'package:truckme/widget/component/back_button_custom.dart';

import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import '../../widget/component/custom_button.dart';

class TravelDetailP extends StatefulWidget {
  const TravelDetailP({super.key});

  @override
  State<TravelDetailP> createState() => _TravelDetailPState();
}

class _TravelDetailPState extends State<TravelDetailP> {

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: BackButtonCustom(
            height: getConfigHeight(0.05),
            width: getConfigWidth(0.15),
          ),
        ),
        title: const Text(
          "Haydash tafsilotlari",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset("assets/images/map.png"),
          Positioned(
            width: getConfigWidth(0.9),
            height: getConfigHeight(0.8),
            child: Column(
              children: [
                Container(
                  width: getConfigWidth(0.9),
                  height: getConfigHeight(0.25),
                  margin: EdgeInsets.fromLTRB(getConfigWidth(0.05), getConfigHeight(0.23),getConfigWidth(0.05),0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                ),

                Text('Haydovchi'),
                Container(
                  height: getConfigHeight(0.1),
                  color: Colors.deepOrange,

                ),

                Text('To\'lov'),

                Container(
                  height: getConfigHeight(0.1),
                  color: Colors.deepOrange,

                ),

                SizedBox(
                  height: getConfigHeight(0.07),
                  width: getConfigWidth(0.8),
                  child: CustomButton(
                    name: "Muammoni ko'taring",
                    textSize: 18,
                    textColor: Colors.white,
                    radius: 15,
                    colorButton: Constants.primaryColor,
                    onTap: () {},
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
