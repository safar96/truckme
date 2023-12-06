import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/page/main/announcement_p.dart';
import 'package:truckme/provider/request_provider.dart';

import '../../model/main/application.dart';
import '../../widget/component/custom_button.dart';
import '../../widget/component/icon_button_custom.dart';
import '../../widget/component/svg_button.dart';
import '../drawer/drawer_p.dart';
import 'main_add_p.dart';

class MainNew extends StatefulWidget {
  const MainNew({super.key});

  @override
  State<MainNew> createState() => _MainNewState();
}

class _MainNewState extends State<MainNew> {
  bool _isNew = true;
  bool _isDelivery = true;
  int _showId = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDataNull = false;
  bool _isLoading = false;
  List<Application> _list = [];
  List<Application> _deliveryList = [];
  List<Application> _orderList = [];

  void _getInfo() async {
    setState(() {
      _isLoading = true;
    });
    _list = await Provider.of<RequestProvider>(context,listen: false).getApplications();
    _deliveryList = _list.where((element) => element.categoryId == 1).toList();
    _orderList = _list.where((element) => element.categoryId == 2).toList();
    _isDataNull = _list.isEmpty;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  // Widget _getList(List<Application> list){
  //   return ListView.builder(
  //     itemCount: list.length,
  //     padding: EdgeInsets.zero,
  //     itemBuilder: (context, index) {
  //       return Padding(
  //         padding: const EdgeInsets.only(top: 15.0),
  //         child: SizedBox(
  //           height: _showId == list[index].categoryId ? getConfigHeight(0.7) : getConfigHeight(0.2),
  //           width: getConfigWidth(0.9),
  //           child: Stack(
  //             alignment: Alignment.topCenter,
  //             children: [
  //               Container(
  //                 height: _showId == list[index].categoryId ? getConfigHeight(0.68) : getConfigHeight(0.18),
  //                 width: getConfigWidth(0.9),
  //                 alignment: Alignment.topCenter,
  //                 decoration: const BoxDecoration(
  //                   color: Colors.white,
  //                   shape: BoxShape.rectangle,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black12,
  //                       spreadRadius: 2,
  //                       blurRadius: 3,
  //                       offset: Offset(0, 0),
  //                     ),
  //                   ],
  //                 ),
  //                 child: Column(
  //                   children: [
  //                     SizedBox(
  //                       height: getConfigHeight(0.06),
  //                       width: getConfigWidth(0.8),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text(
  //                             "№${list[index].categoryId}",
  //                             style: TextStyle(
  //                               color: Constants.unSelectColor,
  //                               fontSize: 18,
  //                             ),
  //                           ),
  //                           Text(
  //                             "5 soat",
  //                             style: TextStyle(
  //                               color: Constants.unSelectColor,
  //                               fontSize: 18,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: getConfigHeight(0.12),
  //                       width: getConfigWidth(0.8),
  //                       child: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Container(
  //                             height: getConfigHeight(0.09),
  //                             width: getConfigWidth(0.2),
  //                             decoration: const BoxDecoration(
  //                               color: Color(0xFFD9D9D9),
  //                               borderRadius: BorderRadius.all(
  //                                 Radius.circular(15),
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: getConfigHeight(0.12),
  //                             width: getConfigWidth(0.25),
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(left: 8.0),
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Isuzu",
  //                                     style: TextStyle(
  //                                       color: Constants.textBlackColor,
  //                                       fontSize: 20,
  //                                       fontWeight: FontWeight.bold,
  //                                     ),
  //                                   ),
  //                                   Text(
  //                                     "Yuk turi",
  //                                     style: TextStyle(
  //                                       color: Constants.textBlackColor,
  //                                       fontSize: 18,
  //                                     ),
  //                                   ),
  //                                   Text(
  //                                     "500 kg",
  //                                     style: TextStyle(
  //                                       color: Constants.textBlackColor,
  //                                       fontSize: 18,
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                           Container(
  //                             height: getConfigHeight(0.1),
  //                             width: getConfigWidth(0.35),
  //                             alignment: Alignment.bottomRight,
  //                             child: Text(
  //                               "1 000 000 so’m",
  //                               style: TextStyle(
  //                                 color: Constants.textBlackColor,
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     if (_showId == ans[index].id)
  //                       Column(
  //                         children: [
  //                           SizedBox(
  //                             height: getConfigHeight(0.05),
  //                             width: getConfigWidth(0.8),
  //                             child: Text(
  //                               "Manzil",
  //                               style: TextStyle(
  //                                 color: Constants.textBlackColor,
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: getConfigHeight(0.12),
  //                             width: getConfigWidth(0.8),
  //                             child: Row(
  //                               children: [
  //                                 Container(
  //                                   height: getConfigHeight(0.11),
  //                                   width: getConfigWidth(0.15),
  //                                   decoration: const BoxDecoration(
  //                                     image: DecorationImage(
  //                                       image: AssetImage("assets/images/ic_route.png"),
  //                                       scale: 2.2,
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: getConfigHeight(0.12),
  //                                   width: getConfigWidth(0.65),
  //                                   child: Column(
  //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                     crossAxisAlignment: CrossAxisAlignment.start,
  //                                     children: [
  //                                       Text(
  //                                         "Zulfiyaxonim ko’chasi, 5A",
  //                                         style: TextStyle(
  //                                           color: Constants.textBlackColor,
  //                                           fontSize: 18,
  //                                         ),
  //                                       ),
  //                                       Text(
  //                                         "Shota Rustaveli ko’chasi, 77A",
  //                                         style: TextStyle(
  //                                           color: Constants.textBlackColor,
  //                                           fontSize: 18,
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: getConfigHeight(0.02),
  //                           ),
  //                           Container(
  //                             height: 2,
  //                             width: getConfigWidth(0.8),
  //                             color: Constants.unSelectColor,
  //                           ),
  //                           SizedBox(
  //                             height: getConfigHeight(0.07),
  //                             width: getConfigWidth(0.8),
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Text(
  //                                   "Masofa",
  //                                   style: TextStyle(
  //                                     color: Constants.textBlackColor,
  //                                     fontSize: 18,
  //                                   ),
  //                                 ),
  //                                 Text(
  //                                   "330 km",
  //                                   style: TextStyle(
  //                                     color: Constants.textBlackColor,
  //                                     fontSize: 18,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           Container(
  //                             height: 2,
  //                             width: getConfigWidth(0.8),
  //                             color: Constants.unSelectColor,
  //                           ),
  //                           SizedBox(
  //                             height: getConfigHeight(0.07),
  //                             width: getConfigWidth(0.8),
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Text(
  //                                   "To’lov turi",
  //                                   style: TextStyle(
  //                                     color: Constants.textBlackColor,
  //                                     fontSize: 18,
  //                                   ),
  //                                 ),
  //                                 Text(
  //                                   "Naqt",
  //                                   style: TextStyle(
  //                                     color: Constants.textBlackColor,
  //                                     fontSize: 18,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           Container(
  //                             height: 2,
  //                             width: getConfigWidth(0.8),
  //                             color: Constants.unSelectColor,
  //                           ),
  //                           SizedBox(
  //                             height: getConfigHeight(0.07),
  //                             width: getConfigWidth(0.8),
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Text(
  //                                   "Yuklash sanasi",
  //                                   style: TextStyle(
  //                                     color: Constants.textBlackColor,
  //                                     fontSize: 18,
  //                                   ),
  //                                 ),
  //                                 Text(
  //                                   "10.10.2023 15:45",
  //                                   style: TextStyle(
  //                                     color: Constants.textBlackColor,
  //                                     fontSize: 18,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: getConfigHeight(0.08),
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                               children: [
  //                                 SizedBox(
  //                                   height: getConfigHeight(0.06),
  //                                   width: getConfigWidth(0.35),
  //                                   child: CustomButton(
  //                                     radius: 15,
  //                                     name: "Bekor qilish",
  //                                     textSize: 15,
  //                                     textColor: Colors.white,
  //                                     onTap: () {},
  //                                     colorButton: const Color(0xFFB60D0D),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: getConfigHeight(0.06),
  //                                   width: getConfigWidth(0.35),
  //                                   child: CustomButton(
  //                                     radius: 15,
  //                                     name: "O’zgartirish",
  //                                     textSize: 15,
  //                                     textColor: Constants.textBlackColor,
  //                                     onTap: () {},
  //                                     colorButton: const Color(0xFFFFFFFF),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           )
  //                         ],
  //                       )
  //                   ],
  //                 ),
  //               ),
  //               Column(
  //                 children: [
  //                   SizedBox(
  //                     height:
  //                     _showId == ans[index].id ? getConfigHeight(0.65) : getConfigHeight(0.15),
  //                   ),
  //                   IconButtonCustom(
  //                     height: getConfigHeight(0.05),
  //                     width: getConfigWidth(0.2),
  //                     url: _showId == ans[index].id
  //                         ? "assets/images/ic_arrow_top.png"
  //                         : "assets/images/ic_arrow.png",
  //                     onTap: () {
  //                       setState(() {
  //                         if (_showId == ans[index].id) {
  //                           _showId = "-1";
  //                         } else {
  //                           _showId = ans[index].id;
  //                         }
  //                       });
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
        height: getConfigFullHeight(),
        child: Column(
          children: [
            Container(
              height: getConfigTopHeight(),
              color: Constants.primaryColor,
            ),
            Container(
              height: getConfigHeight(0.07),
              alignment: Alignment.bottomLeft,
              color: Constants.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getConfigWidth(0.15),
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
                    width: getConfigWidth(0.7),
                    child: const Center(
                      child: Text(
                        "TruckMe",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getConfigHeight(0.06),
              child: Stack(
                children: [
                  Container(
                    height: getConfigHeight(0.04),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius:
                          const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                    ),
                  ),
                  Positioned(
                    top: getConfigHeight(0.01),
                    left: getConfigWidth(0.1),
                    child: SizedBox(
                      height: getConfigHeight(0.05),
                      width: getConfigWidth(0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDelivery = true;
                              });
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              height: double.infinity,
                              width: getConfigWidth(0.38),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _isDelivery ? Constants.primaryColor : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: Text(
                                'Yuk tashish',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _isDelivery ? Colors.white : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDelivery = false;
                              });
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              height: double.infinity,
                              width: getConfigWidth(0.38),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: !_isDelivery ? Constants.primaryColor : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: Text(
                                'Maxsus texnika',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: !_isDelivery ? Colors.white : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getConfigHeight(0.01)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  _isNew = true;
                });
              },
              child: SizedBox(
                height: getConfigHeight(0.05),
                width: getConfigWidth(0.9),
                child: Row(
                  children: [
                    SizedBox(
                      height: getConfigHeight(0.05),
                      width: getConfigWidth(0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: getConfigHeight(0.046),
                            width: getConfigWidth(0.3),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0.0),
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
                            height: getConfigHeight(0.004),
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
                        height: getConfigHeight(0.05),
                        width: getConfigWidth(0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getConfigHeight(0.046),
                              width: getConfigWidth(0.3),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0),
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
                              height: getConfigHeight(0.004),
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
                      width: getConfigWidth(0.28),
                      alignment: Alignment.bottomRight,
                      child: IconButtonCustom(
                        height: getConfigHeight(0.045),
                        width: getConfigWidth(0.15),
                        url: "assets/images/lucide_filter.png",
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: getConfigHeight(0.01)),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : !_isDataNull
                    ? Container(
                        height: getConfigHeight(0.68),
                        width: getConfigWidth(1),
                        alignment: Alignment.topCenter,
                        // child:
                      )
                    : SizedBox(
                        height: getConfigHeight(0.68),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/order.png',
                              scale: 3,
                            ),
                            const Text(
                              'Buyurtmalar mavjud emas',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MainAddP(),
          ));
        },
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: getConfigHeight(0.04),
          child: Image.asset('assets/images/add.png'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: getConfigHeight(0.075),
        shape: const CircularNotchedRectangle(),
        color: Constants.primaryColor,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: const DrawerP(),
    );
  }
}
