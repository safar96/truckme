import 'package:flutter/material.dart';

import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import '../../widget/component/drop_down_button.dart';
import '../../widget/component/text_input_form.dart';

class DeliveryRequestP extends StatefulWidget {
  const DeliveryRequestP({super.key});

  @override
  State<DeliveryRequestP> createState() => _DeliveryRequestPState();
}

class _DeliveryRequestPState extends State<DeliveryRequestP> {
  final List<DropDownModel> _list = [
    DropDownModel(id: 1, name: "test1"),
    DropDownModel(id: 2, name: "test2"),
    DropDownModel(id: 3, name: "test4")
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: SizedBox(
        height: getConfigFullHeight(),
        child: Column(
          children: [
            Container(
              height: getConfigTopHeight(),
            ),
            Container(
              height: getConfigHeight(0.08),
              alignment: Alignment.center,
              child: Text(
                "Yuk tashish",
                style: TextStyle(
                  color: Theme.of(context).textTheme.titleSmall?.color,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DropDownButton(
              titleHeight: getConfigHeight(0.05),
              titleWidth: getConfigWidth(0.9),
              title: "Avtomabil turi".toUpperCase(),
              dropDownHeight: getConfigHeight(0.07),
              dropDownWidth: getConfigWidth(0.9),
              onSelect: (m) {},
              data: _list,
              initialData: _list.first,
            ),
            DropDownButton(
              titleHeight: getConfigHeight(0.05),
              titleWidth: getConfigWidth(0.9),
              title: "yuk turlari".toUpperCase(),
              dropDownHeight: getConfigHeight(0.07),
              dropDownWidth: getConfigWidth(0.9),
              onSelect: (m) {},
              data: _list,
              initialData: _list.first,
            ),
            Container(
              height: getConfigHeight(0.05),
              width: getConfigWidth(0.9),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "yuk hajmi".toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFF3E4958),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              width: getConfigWidth(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextInputForm(
                    titleHeight: getConfigHeight(0.0),
                    titleWidth: getConfigWidth(0.0),
                    title: "",
                    inputHeight: getConfigHeight(0.06),
                    inputWidth: getConfigWidth(0.25),
                    placeholder: "",
                    controller: TextEditingController(),
                    inputType: TextInputType.emailAddress,
                  ),
                  TextInputForm(
                    titleHeight: getConfigHeight(0.0),
                    titleWidth: getConfigWidth(0.0),
                    title: "",
                    inputHeight: getConfigHeight(0.06),
                    inputWidth: getConfigWidth(0.25),
                    placeholder: "",
                    controller: TextEditingController(),
                    inputType: TextInputType.emailAddress,
                  ),
                  TextInputForm(
                    titleHeight: getConfigHeight(0.0),
                    titleWidth: getConfigWidth(0.0),
                    title: "",
                    inputHeight: getConfigHeight(0.06),
                    inputWidth: getConfigWidth(0.25),
                    placeholder: "",
                    controller: TextEditingController(),
                    inputType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: getConfigWidth(0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextInputForm(
                    titleHeight: getConfigHeight(0.05),
                    titleWidth: getConfigWidth(0.4),
                    title: "Og'irligi".toUpperCase(),
                    inputHeight: getConfigHeight(0.06),
                    inputWidth: getConfigWidth(0.4),
                    placeholder: "",
                    controller: TextEditingController(),
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(width: getConfigWidth(0.1)),
                  TextInputForm(
                    titleHeight: getConfigHeight(0.05),
                    titleWidth: getConfigWidth(0.4),
                    title: "Miqdori".toUpperCase(),
                    inputHeight: getConfigHeight(0.06),
                    inputWidth: getConfigWidth(0.4),
                    placeholder: "",
                    controller: TextEditingController(),
                    inputType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
