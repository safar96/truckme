import 'package:flutter/material.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/widget/component/language_card.dart';

import '../../model/card/card_list.dart';
import '../../widget/component/back_button_custom.dart';
import '../../widget/component/card_with_right.dart';

class PaymentP extends StatefulWidget {
  const PaymentP({super.key});

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
          margin:const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: BackButtonCustom(
            height: getConfigHeight(0.05),
            width: getConfigWidth(0.15),
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
              height: getConfigHeight(0.1) * _cardList.length+getConfigHeight(0.1),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child:const Text(
                        'Bank kartalari',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    for(CardList card in _cardList)
                      _cardWidget(card),
                    Container(
                      child: CardWithRight(
                        imageUrl: "assets/images/humo.png",
                        height: getConfigHeight(0.07),
                        width: getConfigWidth(0.8),
                        title: "Karta qo'shish",
                        onTap: () {},
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: getConfigHeight(0.2) * _others.length+getConfigHeight(0.1),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8,
                      ),
                      child: const Text(
                        'Boshqa usullar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _others.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              LanguageCard(
                                height: getConfigHeight(0.07),
                                width: getConfigWidth(0.8),
                                imageUrl: "assets/images/ic_cash.png",
                                title: _others[index].account,
                                isSelected: true,
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
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


 Widget _cardWidget(CardList cardList){
    return
      Column(
        children: [
          LanguageCard(
            height: getConfigHeight(0.07),
            width: getConfigWidth(0.8),
            imageUrl: cardList.card_type == "humo"
                ? "assets/images/humo.png"
                : "assets/images/uzcard.png",
            title: cardList.account,
            isSelected: true,
            onTap: () {},
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      );
    }

}
