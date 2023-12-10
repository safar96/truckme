import 'package:flutter/material.dart';
import 'package:truckme/page/main/special_auto_request_p.dart';
import 'package:truckme/widget/component/back_button_custom.dart';

import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import 'delivery_request_p.dart';

class MainAddP extends StatelessWidget {
  const MainAddP({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Constants.primaryColor,
          centerTitle: true,
          leading: Container(
            height: getConfigHeight(0.1),
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: BackButtonCustom(
              height: getConfigHeight(0.05),
              width: getConfigWidth(0.15),
            ),
          ),
          title: const Text(
            "Turni tanlang",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: getConfigWidth(1),
            height: getConfigHeight(1),
            child: Column(
              children: [
                Container(
                  height: getConfigHeight(0.04),
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  ),
                ),
                SizedBox(
                  height: getConfigHeight(0.05),
                ),
                SizedBox(
                  height: getConfigHeight(0.7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DeliveryRequestP(isNew: true),
                            ),
                          );
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          width: getConfigWidth(0.9),
                          height: getConfigHeight(0.2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: getConfigWidth(0.35),
                                child: const Text(
                                  'Yuk tashish',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: getConfigWidth(0.02),
                              ),
                              Image.asset(
                                'assets/images/truck.png',
                                width: getConfigWidth(0.5),
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getConfigHeight(0.05),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SpecialAutoRequestP(),
                            ),
                          );
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          width: getConfigWidth(0.9),
                          height: getConfigHeight(0.2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: getConfigWidth(0.35),
                                child: const Text(
                                  'Maxsus Texnika',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: getConfigWidth(0.02),
                              ),
                              Image.asset(
                                'assets/images/excavator.png',
                                width: getConfigWidth(0.5),
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
