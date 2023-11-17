import 'package:flutter/material.dart';
import 'package:truckme/widget/component/driver_detail_card.dart';

import '../../core/component/size_config.dart';
import '../../widget/component/back_button_custom.dart';

class DriverDetailP extends StatefulWidget {
  const DriverDetailP({super.key});

  @override
  State<DriverDetailP> createState() => _DriverDetailPState();
}

class _DriverDetailPState extends State<DriverDetailP> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: BackButtonCustom(
            height: getConfigHeight(0.05),
            width: getConfigWidth(0.15),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Haydovchi tafsilotlari",
          style: TextStyle(
            color: Theme.of(context).textTheme.titleSmall?.color,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage("assets/images/photo_driver.png"),
                    radius: getConfigHeight(0.05),
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
                    ],
                  )
                ],
              ),
              SizedBox(
                height: getConfigHeight(0.05),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DriverDetailCard(
                      imageUrl: "assets/images/star.png", title: '4.8'),
                  DriverDetailCard(
                      imageUrl: "assets/images/ic_favourite.png", title: '126'),
                  DriverDetailCard(
                      imageUrl: "assets/images/ic_calendar.png",
                      title: '2 yil'),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: const EdgeInsets.fromLTRB(25, 40, 25, 20),
                height: getConfigHeight(0.3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'A\'zo bo\'lgan sana',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Text('16.06.1617', style: TextStyle(
                      fontSize: 16,
                    ),),
                    // SizedBox(height: getConfigHeight(0.01),),
                    Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),

                    Text('Avtomobil turi', style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),),
                    Text('Isuzu',style: TextStyle(
                      fontSize: 16,
                    ),),
                    // SizedBox(height: getConfigHeight(0.01),),
                    Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),

                    Text('Raqami',style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),),
                    Text('01 A 444 AA',style: TextStyle(
                      fontSize: 16,
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
