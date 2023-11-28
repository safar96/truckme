import 'package:flutter/material.dart';
import 'package:truckme/page/drawer/driver_detail_p.dart';
import 'package:truckme/page/drawer/travel_bottom_p.dart';
import 'package:truckme/widget/component/back_button_custom.dart';
import 'package:truckme/widget/component/text_with_right.dart';

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
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: BackButtonCustom(
            height: getConfigHeight(0.05),
            width: getConfigWidth(0.15),
          ),
        ),
        title:  Text(
          "Haydash tafsilotlari",
          style: TextStyle(
            color: Theme.of(context).textTheme.titleSmall?.color,
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
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: getConfigWidth(0.1),
                              height: getConfigHeight(0.1),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Zulfiyaxonim ko’chasi, 5A'),
                                  Text('Shota Rustaveli ko’chasi, 77A'),
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
            padding:const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Haydovchi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: getConfigHeight(0.12),
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 16,),
                      CircleAvatar(
                          backgroundImage: const AssetImage(
                              "assets/images/photo_driver.png"),
                          radius: getConfigHeight(0.04),
                      ),
                      SizedBox(
                        width: getConfigWidth(0.05),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Profile',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            'Oq Izusu',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 12,
                                height: 12,
                                child: Image.asset("assets/images/Star1.png",fit: BoxFit.cover),
                              ),
                              SizedBox(width: 4,),
                              const  Text(
                                '4.8',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DriverDetailP(),
                          ));
                        },
                        child: Container(
                          width: 50,
                          margin: EdgeInsets.only(left: getConfigWidth(0.30)),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/right.png",
                              ),
                              scale: 1.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               const Text(
                  'To\'lov',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: getConfigHeight(0.06),
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: getConfigWidth(0.02),
                      ),
                      Image.asset("assets/images/cards.png"),
                      Text('*****8952'),
                      SizedBox(
                        width: getConfigWidth(0.3),
                      ),
                      const Text(
                        '9000',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "so'm",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
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

void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return TravelBottomP();
        }
    );
}
