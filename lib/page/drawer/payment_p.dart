import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/widget/component/language_card.dart';
import 'package:truckme/widget/component/work_type_card.dart';

import '../../model/card/card_list.dart';
import '../../widget/component/card_with_right.dart';

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
    CardList(account: "****4584", card_type: "uzcard"),
    CardList(account: "****4584", card_type: "humo"),
    CardList(account: "****4584", card_type: "uzcard"),
  ];

  final List<CardList> _others = [
    CardList(account: "Naqt", card_type: "Naqt"),
    CardList(account: "Pul o'tkazish", card_type: "pul"),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(
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
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ),
        title: const Text(
          "To'lov usuli",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.brown,
              height: getConfigHeight(0.1) * _cardList.length,
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bank kartalari',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(),
                          itemCount: _cardList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return LanguageCard(
                                height: getConfigHeight(0.07),
                                width: getConfigWidth(0.9),
                                imageUrl: _cardList[index].card_type == "humo"
                                    ? "assets/images/humo.png"
                                    : "assets/images/uzcard.png",
                                title: _cardList[index].account,
                                isSelected: true,
                                onTap: () {},
                            );
                          },
                        ),
                    ),

                    CardWithRight(
                      imageUrl: "assets/images/humo.png",
                      height: getConfigHeight(0.07),
                      width: getConfigWidth(0.9),
                      title: "Karta qo'shish",
                      onTap: () {},
                    ),
                  ]),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.brown,
              height: getConfigHeight(0.2) * _others.length,
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Boshqa usullar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    // const SizedBox(height: 8,),
                    for (var card in _others)
                      LanguageCard(
                          height: getConfigHeight(0.07),
                          width: getConfigWidth(0.9),
                          imageUrl: "assets/images/humo.png",
                          title: card.account,
                          isSelected: true,
                          onTap: () {}),

                    const SizedBox(
                      height: 8,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
