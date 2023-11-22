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
      body: Column(
        children: [
          Container(
            height: getConfigHeight(0.41),
            child: Stack(
              children: [
                Image.asset("assets/images/map.png"),
                Positioned(
                  child: Column(
                    children: [
                      Container(
                        width: getConfigWidth(0.9),
                        height: getConfigHeight(0.16),
                        margin: EdgeInsets.fromLTRB(getConfigWidth(0.07),
                            getConfigHeight(0.22), getConfigWidth(0.07), 0),
                        decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: getConfigWidth(0.1),
                              height: getConfigHeight(0.1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '11:39',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                   '11:50',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              "assets/images/ic_route.png",
                              scale: 3,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: getConfigHeight(0.1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('widget.travelHistory.fromAdress'),
                                  Text('widget.travelHistory.toAdress'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: getConfigHeight(0.52),
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Haydovchi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: getConfigHeight(0.15),
                  decoration: BoxDecoration(
                    color: Colors.cyan,

                    borderRadius:
                    BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundImage:
                          const AssetImage("assets/images/photo_driver.png"),
                          radius: getConfigHeight(0.05),
                        ),
                      ),
                      SizedBox(
                        width: getConfigWidth(0.05),
                      ),
                      const Column(
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Oq Izusu',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [

                              Text(
                                '4.8',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  'To\'lov',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: getConfigHeight(0.06),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius:
                    BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/cards.png"),
                      Text('*****8952'),
                      SizedBox(width: 50,),
                      Text('9000'),
                      Text('so\'m'),
                    ],
                  ),
                ),
                Container(
                  height: getConfigHeight(0.07),
                  width: getConfigWidth(0.9),
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
          )
        ],
      ),
    );
  }
}
