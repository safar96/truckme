import 'package:flutter/material.dart';
import 'package:truckme/core/component/size_config.dart';

import '../../model/history/travel_history.dart';

class HistoryCard extends StatefulWidget {
  final TravelHistory travelHistory;

  const HistoryCard({super.key, required this.travelHistory});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      padding: EdgeInsets.all(25),
      height: getConfigHeight(0.2),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.travelHistory.date,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                widget.travelHistory.isActive ? 'Faol'.toUpperCase():'Bekor QIlindi'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color:
                      widget.travelHistory.isActive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Row(
            children: [
              SizedBox(
                width: getConfigWidth(0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.travelHistory.fromTime,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      widget.travelHistory.toTime,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.travelHistory.fromAdress),
                  Text(widget.travelHistory.toAdress),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
