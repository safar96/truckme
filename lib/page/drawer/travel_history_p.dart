import 'package:flutter/material.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/model/history/travel_history.dart';
import 'package:truckme/page/drawer/drawer_p.dart';
import 'package:truckme/page/drawer/travel_details_p.dart';
import 'package:truckme/widget/component/history_card.dart';

import '../../core/component/size_config.dart';
import '../../widget/component/back_button_custom.dart';

class TravelHistoryP extends StatefulWidget {
  TravelHistoryP({super.key});

  final List<TravelHistory> list = [
    TravelHistory(true, '8 may 2019,18:39', '11:24', '11:38',
        'Zulfiyaxonim ko’chasi, 5A', 'Shota Rustaveli ko’chasi, 77A'),
    TravelHistory(false, '8 may 2019,18:39', '11:24', '11:38',
        'Zulfiyaxonim ko’chasi, 5A', 'Shota Rustaveli ko’chasi, 77A'),
    TravelHistory(true, '8 may 2019,18:39', '11:24', '11:38',
        'Zulfiyaxonim ko’chasi, 5A', 'Shota Rustaveli ko’chasi, 77A'),
    TravelHistory(false, '8 may 2019,18:39', '11:24', '11:38',
        'Zulfiyaxonim ko’chasi, 5A', 'Shota Rustaveli ko’chasi, 77A'),
    TravelHistory(false, '8 may 2019,18:39', '11:24', '11:38',
        'Zulfiyaxonim ko’chasi, 5A', 'Shota Rustaveli ko’chasi, 77A'),
    TravelHistory(true, '8 may 2019,18:39', '11:24', '11:38',
        'Zulfiyaxonim ko’chasi, 5A', 'Shota Rustaveli ko’chasi, 77A'),
  ];

  @override
  State<TravelHistoryP> createState() => _TravelHistoryPState();
}

class _TravelHistoryPState extends State<TravelHistoryP> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Container(
                  height: getConfigHeight(0.05),
                  width: getConfigWidth(0.15),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: IconButton(
                      onPressed: () {
                        print("back tapped");
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
            ),
            bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              indicatorColor: Constants.primaryColor,
              unselectedLabelColor: Colors.grey,
              labelColor: Constants.primaryColor,
              tabs: const [
                Tab(
                  child: Text(
                    'Barchasi',
                    textAlign: TextAlign.center,
                    // style: TextStyle(color: Colors.cyan),
                  ),
                ),
                Tab(
                  child: Text(
                    'Faol',
                    textAlign: TextAlign.center,
                    // style: TextStyle(color: Colors.grey),
                  ),
                ),
                Tab(
                  child: Text(
                    'Bekor qilingan',
                    textAlign: TextAlign.center,
                    // style: TextStyle(color: Colors.grey),
                  ),
                ),
                Tab(
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       border: Border.all(color: Colors.redAccent, width: 1)),
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Text("APPS"),
                  //   ),
                  // ),
                  child: Text(
                    'Tugallangan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            title: Text(
              "Buyurtmalar tarixi",
              style: TextStyle(
                color: Theme.of(context).textTheme.titleSmall?.color,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (TravelHistory item in widget.list)
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const TravelDetailP(),
                              ));
                            },
                            child: Container(
                              child: HistoryCard(
                                travelHistory: TravelHistory(
                                    item.isActive,
                                    item.date,
                                    item.fromTime,
                                    item.toTime,
                                    item.fromAdress,
                                    item.toAdress),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (TravelHistory item
                            in widget.list.where((element) => element.isActive))
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const TravelDetailP(),
                              ));
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: HistoryCard(
                                    travelHistory: TravelHistory(
                                        item.isActive,
                                        item.date,
                                        item.fromTime,
                                        item.toTime,
                                        item.fromAdress,
                                        item.toAdress))),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (TravelHistory item in widget.list
                            .where((element) => !element.isActive))
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const TravelDetailP(),
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: HistoryCard(
                                travelHistory: TravelHistory(
                                    item.isActive,
                                    item.date,
                                    item.fromTime,
                                    item.toTime,
                                    item.fromAdress,
                                    item.toAdress),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (TravelHistory item in widget.list)
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const TravelDetailP(),
                              ));
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: HistoryCard(
                                    travelHistory: TravelHistory(
                                        item.isActive,
                                        item.date,
                                        item.fromTime,
                                        item.toTime,
                                        item.fromAdress,
                                        item.toAdress))),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: const  DrawerP(),
        ),
      ),
    );
  }
}
