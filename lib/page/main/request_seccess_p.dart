import 'package:flutter/material.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/page/main/main_p.dart';
import 'package:truckme/widget/component/back_button_custom.dart';
import 'package:truckme/widget/component/custom_button.dart';

class RequestSuccessP extends StatelessWidget {
  final String from;
  final String to;
  final bool isDelivery;

  const RequestSuccessP({
    super.key,
    required this.from,
    required this.to,
    required this.isDelivery,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SizedBox(
        height: getConfigFullHeight(),
        width: getConfigWidth(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getConfigTopHeight(),
            ),
            Container(
              height: getConfigHeight(0.1),
              width: getConfigWidth(0.9),
              alignment: Alignment.centerLeft,
              child: BackButtonCustom(
                height: getConfigHeight(0.07),
                width: getConfigWidth(0.1),
              ),
            ),
            SizedBox(
              height: getConfigHeight(0.1),
            ),
            Container(
              height: getConfigHeight(0.6),
              width: getConfigWidth(0.9),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getConfigHeight(0.05),
                  ),
                  Container(
                    height: getConfigHeight(0.1),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/ic_success.png"),
                      ),
                    ),
                  ),
                  Container(
                    height: getConfigHeight(0.1),
                    alignment: Alignment.center,
                    child: const Text(
                      "Sizning arizangiz\nyaratildi",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (isDelivery)
                    Container(
                      height: getConfigHeight(0.2),
                      width: getConfigWidth(0.8) + 2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFF97ADB6),
                          width: 0.8,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: getConfigWidth(0.15),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/ic_route.png"),
                                scale: 2.2,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getConfigWidth(0.65),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: getConfigHeight(0.08) - 0.5,
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      from,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Constants.textBlackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: getConfigWidth(0.65),
                                  color: const Color(0xFFD5DDE0),
                                ),
                                Container(
                                  height: getConfigHeight(0.08) - 0.5,
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      to,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Constants.textBlackColor,
                                      ),
                                    ),
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
            SizedBox(
              height: getConfigHeight(0.1),
            ),
            SizedBox(
              height: getConfigHeight(0.08),
              width: getConfigWidth(0.9),
              child: CustomButton(
                radius: 15,
                name: "Xop",
                textSize: 18,
                textColor: Constants.backgroundColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainP(),
                    ),
                  );
                },
                colorButton: Constants.primaryColor,
              ),
            ),
            SizedBox(
              height: getConfigHeight(0.02),
            ),
          ],
        ),
      ),
    );
  }
}
