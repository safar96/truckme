import 'package:flutter/material.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/page/drawer/drawer_p.dart';
import 'package:truckme/page/main/announcement_p.dart';
import 'package:truckme/page/main/delivery_request_p.dart';
import 'package:truckme/page/main/special_auto_request_p.dart';
import 'package:truckme/widget/component/direction_card.dart';
import 'package:truckme/widget/component/out_button.dart';
import 'package:truckme/widget/component/svg_button.dart';
import 'package:truckme/widget/component/work_type_card.dart';

import '../../core/component/size_config.dart';

class MainP extends StatefulWidget {
  const MainP({super.key});

  @override
  State<MainP> createState() => _MainPState();
}

class _MainPState extends State<MainP> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isNew = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constants.backgroundColor,
      body: SizedBox(
        height: getConfigFullHeight(),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Column(
                children: [
                  Container(
                    height: getConfigTopHeight(),
                    color: Constants.primaryColor,
                  ),
                  Container(
                    height: getConfigHeight(0.65),
                    width: getConfigWidth(1),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/main1.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: getConfigHeight(0.1),
                          alignment: Alignment.centerLeft,
                          child: SvgButton(
                            imageUrl: "assets/icons/drawer.svg",
                            height: 75,
                            width: 75,
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                        ),
                        SizedBox(
                          height: getConfigHeight(0.07),
                          width: getConfigWidth(0.9),
                          child: Row(
                            children: [
                              OutButton(
                                height: getConfigHeight(0.055),
                                width: getConfigWidth(0.28),
                                title: "Aktive",
                                onTap: () {
                                  setState(() {
                                    _isNew = false;
                                  });
                                },
                                titleColor: !_isNew ? Constants.primaryColor : Colors.white,
                                backgroundColor: !_isNew ? Constants.backgroundColor : Constants.secondaryColor,
                              ),
                              const SizedBox(width: 20),
                              OutButton(
                                height: getConfigHeight(0.055),
                                width: getConfigWidth(0.28),
                                title: "Yangi",
                                onTap: () {
                                  setState(() {
                                    _isNew = true;
                                  });
                                },
                                titleColor: _isNew ? Constants.primaryColor : Colors.white,
                                backgroundColor: _isNew ? Constants.backgroundColor : Constants.secondaryColor,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: getConfigHeight(0.05),
                          width: getConfigWidth(0.9),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            !_isNew ? "Aktive buyurtmalar".toUpperCase() : "Yangi buyurtmalar".toUpperCase(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getConfigHeight(0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WorkTypeCard(
                                height: getConfigHeight(0.075),
                                width: getConfigWidth(0.9),
                                title: "Yuk tashish",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AnnouncementP(
                                        isDelivery: true,
                                        isNew: _isNew,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              WorkTypeCard(
                                height: getConfigHeight(0.075),
                                width: getConfigWidth(0.9),
                                title: "Maxsus transport",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AnnouncementP(
                                        isDelivery: false,
                                        isNew: _isNew,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.35),
                    width: getConfigWidth(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DirectionCard(
                          height: getConfigHeight(0.13),
                          width: getConfigWidth(0.4),
                          imageUrl: "assets/images/car.png",
                          title: "Yuk tashish",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DeliveryRequestP(),
                              ),
                            );
                          },
                        ),
                        DirectionCard(
                          height: getConfigHeight(0.13),
                          width: getConfigWidth(0.4),
                          imageUrl: "assets/images/car.png",
                          title: "Maxsus transport",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SpecialAutoRequestP(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: getConfigHeight(0.52),
                  ),
                  Container(
                    height: getConfigHeight(0.3),
                    width: getConfigWidth(0.7),
                    alignment: Alignment.centerRight,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/track2.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: const DrawerP(),
    );
  }
}
