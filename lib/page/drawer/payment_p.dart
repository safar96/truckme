import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/widget/component/language_card.dart';
import 'package:truckme/widget/component/work_type_card.dart';

import '../../model/card/card_list.dart';

class PaymentP extends StatefulWidget {
  const PaymentP({super.key, required this.cardList});

  final List<CardList> cardList;

  @override
  State<PaymentP> createState() => _PaymentPState();
}

class _PaymentPState extends State<PaymentP> {
  final List<CardList> _cardList = [
    CardList(account: "****8295", card_type: "humo"),
    CardList(account: "****3704", card_type: "uzcard"),
    CardList(account: "****4584", card_type: "humo"),
    CardList(account: "****4584", card_type: "humo"),
    CardList(account: "****4584", card_type: "humo"),
    CardList(account: "****4584", card_type: "humo"),
  ];

  List<int> text = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CircleAvatar(
           maxRadius:getConfigWidth(0.01) ,
        ),
        title: Text("To'lov usuli",
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.brown,
            height: getConfigHeight(0.2)*_cardList.length,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var card in _cardList)
                    LanguageCard(
                        height: getConfigHeight(0.07),
                        width: getConfigWidth(0.9),
                        imageUrl: card.card_type=="humo"? "assets/images/humo.png":"assets/images/russia.png",
                        title: card.account,
                        isSelected: true,
                        onTap: () {}),

                  const SizedBox(
                    height: 8,
                  ),

                  WorkTypeCard(
                    height: getConfigHeight(0.07),
                    width: getConfigWidth(0.9),
                    title: "Karta qo'shish",
                    onTap: () {},
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
