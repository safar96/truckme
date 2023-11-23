import 'package:flutter/material.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/model/main/advertisement.dart';
import 'package:truckme/widget/component/back_button_custom.dart';
import 'package:truckme/widget/component/custom_button.dart';
import 'package:truckme/widget/component/icon_button_custom.dart';

List<Advertisement> ans = [
  Advertisement(
    id: "000001",
    image: "assets/images/car.png",
    carName: "Isuzu",
    weightType: "Yuk turi",
    weight: "500",
    amount: "1000000",
    date: "11.12.2023",
    from: "Zulfiyaxonim ko’chasi, 5A",
    to: "Shota Rustaveli ko’chasi, 77A",
    mile: "330",
    paymentType: "Naqt",
  ),
  Advertisement(
    id: "000002",
    image: "assets/images/car.png",
    carName: "Kamaz",
    weightType: "Yuk turi",
    weight: "500",
    amount: "1000000",
    date: "11.12.2023",
    from: "Zulfiyaxonim ko’chasi, 5A",
    to: "Shota Rustaveli ko’chasi, 77A",
    mile: "330",
    paymentType: "Naqt",
  ),
  Advertisement(
    id: "000003",
    image: "assets/images/car.png",
    carName: "Labo",
    weightType: "Yuk turi",
    weight: "500",
    amount: "1000000",
    date: "11.12.2023",
    from: "Zulfiyaxonim ko’chasi, 5A",
    to: "Shota Rustaveli ko’chasi, 77A",
    mile: "330",
    paymentType: "Naqt",
  ),
];

class AnnouncementP extends StatefulWidget {
  final bool isDelivery;
  final bool isNew;

  const AnnouncementP({
    super.key,
    required this.isDelivery,
    required this.isNew,
  });

  @override
  State<AnnouncementP> createState() => _AnnouncementPState();
}

class _AnnouncementPState extends State<AnnouncementP> {
  bool _isNew = true;
  String _showId = "-1";

  @override
  void initState() {
    super.initState();
    _isNew = widget.isNew;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            _isNew = true;
          } else if (details.delta.dx < 0) {
            _isNew = false;
          }
          setState(() {});
        },
        child: SizedBox(
          height: getConfigFullHeight(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getConfigTopHeight(),
              ),
              SizedBox(
                height: getConfigHeight(0.08),
                width: getConfigWidth(1),
                child: Row(
                  children: [
                    BackButtonCustom(
                      height: getConfigHeight(0.05),
                      width: getConfigWidth(0.15),
                    ),
                    Container(
                      height: getConfigHeight(0.08),
                      width: getConfigWidth(0.7),
                      alignment: Alignment.center,
                      child: Text(
                        "E’lonlar",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.titleSmall?.color,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    _isNew = true;
                  });
                },
                child: SizedBox(
                  height: getConfigHeight(0.1),
                  width: getConfigWidth(0.9),
                  child: Row(
                    children: [
                      SizedBox(
                        height: getConfigHeight(0.08),
                        width: getConfigWidth(0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getConfigHeight(0.08) - 3,
                              width: getConfigWidth(0.3),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  "Yangi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: _isNew ? Constants.primaryColor : Constants.unSelectColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 3,
                              width: getConfigWidth(0.3),
                              decoration: BoxDecoration(
                                color: _isNew ? Constants.primaryColor : Constants.unSelectColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            _isNew = false;
                          });
                        },
                        child: SizedBox(
                          height: getConfigHeight(0.08),
                          width: getConfigWidth(0.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: getConfigHeight(0.08) - 3,
                                width: getConfigWidth(0.3),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    "Active",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: !_isNew ? Constants.primaryColor : Constants.unSelectColor,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 3,
                                width: getConfigWidth(0.3),
                                decoration: BoxDecoration(
                                  color: !_isNew ? Constants.primaryColor : Constants.unSelectColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: getConfigWidth(0.3) - 5,
                        alignment: Alignment.bottomRight,
                        child: IconButtonCustom(
                          height: getConfigHeight(0.05),
                          width: getConfigWidth(0.15),
                          url: "assets/images/lucide_filter.png",
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: getConfigHeight(0.82) - 10,
                width: getConfigWidth(1),
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  itemCount: ans.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        height: _showId == ans[index].id ? getConfigHeight(0.7) : getConfigHeight(0.2),
                        width: getConfigWidth(0.9),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: _showId == ans[index].id ? getConfigHeight(0.68) : getConfigHeight(0.18),
                              width: getConfigWidth(0.9),
                              alignment: Alignment.topCenter,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getConfigHeight(0.06),
                                    width: getConfigWidth(0.8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "№000001",
                                          style: TextStyle(
                                            color: Constants.textBlackColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "5 soat",
                                          style: TextStyle(
                                            color: Constants.textBlackColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getConfigHeight(0.12),
                                    width: getConfigWidth(0.8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: getConfigHeight(0.09),
                                          width: getConfigWidth(0.2),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFD9D9D9),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.12),
                                          width: getConfigWidth(0.25),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Isuzu",
                                                  style: TextStyle(
                                                    color: Constants.textBlackColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Yuk turi",
                                                  style: TextStyle(
                                                    color: Constants.textBlackColor,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  "500 kg",
                                                  style: TextStyle(
                                                    color: Constants.textBlackColor,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: getConfigHeight(0.1),
                                          width: getConfigWidth(0.35),
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "1 000 000 so’m",
                                            style: TextStyle(
                                              color: Constants.textBlackColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_showId == ans[index].id)
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: getConfigHeight(0.05),
                                          width: getConfigWidth(0.8),
                                          child: Text(
                                            "Manzil",
                                            style: TextStyle(
                                              color: Constants.textBlackColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.12),
                                          width: getConfigWidth(0.8),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: getConfigHeight(0.11),
                                                width: getConfigWidth(0.15),
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/ic_route.png"),
                                                    scale: 2.2,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: getConfigHeight(0.12),
                                                width: getConfigWidth(0.65),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Zulfiyaxonim ko’chasi, 5A",
                                                      style: TextStyle(
                                                        color: Constants.textBlackColor,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Shota Rustaveli ko’chasi, 77A",
                                                      style: TextStyle(
                                                        color: Constants.textBlackColor,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          height: 2,
                                          width: getConfigWidth(0.8),
                                          color: Constants.unSelectColor,
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.07),
                                          width: getConfigWidth(0.8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Masofa",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "330 km",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 2,
                                          width: getConfigWidth(0.8),
                                          color: Constants.unSelectColor,
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.07),
                                          width: getConfigWidth(0.8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "To’lov turi",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "Naqt",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 2,
                                          width: getConfigWidth(0.8),
                                          color: Constants.unSelectColor,
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.07),
                                          width: getConfigWidth(0.8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Yuklash sanasi",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "10.10.2023 15:45",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.08),
                                          child: Row(

                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                            children: [
                                              SizedBox(
                                                height: getConfigHeight(0.06),
                                                width: getConfigWidth(0.35),
                                                child: CustomButton(
                                                  radius: 15,
                                                  name: "Bekor qilish",
                                                  textSize: 15,
                                                  textColor: Colors.white,
                                                  onTap: (){},
                                                  colorButton: const Color(0xFFB60D0D),
                                                ),
                                              ),
                                              SizedBox(
                                                height: getConfigHeight(0.06),
                                                width: getConfigWidth(0.35),
                                                child: CustomButton(
                                                  radius: 15,
                                                  name: "O’zgartirish",
                                                  textSize: 15,
                                                  textColor: Constants.textBlackColor,
                                                  onTap: (){},
                                                  colorButton: const Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: _showId == ans[index].id ? getConfigHeight(0.65) : getConfigHeight(0.15),
                                ),
                                IconButtonCustom(
                                  height: getConfigHeight(0.05),
                                  width: getConfigWidth(0.2),
                                  url: _showId == ans[index].id ? "assets/images/ic_arrow_top.png" : "assets/images/ic_arrow.png",
                                  onTap: () {
                                    setState(() {
                                      if (_showId == ans[index].id) {
                                        _showId = "-1";
                                      } else {
                                        _showId = ans[index].id;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
