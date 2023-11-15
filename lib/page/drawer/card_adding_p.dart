import 'package:flutter/material.dart';

import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import '../../widget/component/custom_button.dart';
import '../../widget/component/text_input_form.dart';

class CardAddingP extends StatelessWidget {
  CardAddingP({super.key});

  final TextEditingController _vCardNumer = TextEditingController();
  final TextEditingController _vCardOwner = TextEditingController();
  final TextEditingController _vExpiredDate1 = TextEditingController();
  final TextEditingController _vExpiredDate2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(
        leading:Container(
          padding:const EdgeInsets.fromLTRB(20,5,0,5),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            elevation: 3.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12),
            shape:const  CircleBorder(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Karta qo'shing",
          style: TextStyle(
            color: Theme.of(context).textTheme.titleSmall?.color,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: getConfigHeight(0.05),
                    width: getConfigWidth(0.8),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Karta raqami".toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFF3E4958),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getConfigWidth(0.8),
                    child: TextInputForm(
                      titleHeight: getConfigHeight(0.0),
                      titleWidth: getConfigWidth(0.0),
                      title: "",
                      inputHeight: getConfigHeight(0.06),
                      inputWidth: getConfigWidth(0.8),
                      placeholder: "",
                      controller: _vCardNumer,
                      inputType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    height: getConfigHeight(0.05),
                    width: getConfigWidth(0.8),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Karta egasining ismi".toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFF3E4958),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getConfigWidth(0.8),
                    child: TextInputForm(
                      titleHeight: getConfigHeight(0.0),
                      titleWidth: getConfigWidth(0.0),
                      title: "",
                      inputHeight: getConfigHeight(0.06),
                      inputWidth: getConfigWidth(0.8),
                      placeholder: "",
                      controller: _vCardOwner,
                      inputType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    width: getConfigWidth(0.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextInputForm(
                          titleHeight: getConfigHeight(0.05),
                          titleWidth: getConfigWidth(0.4),
                          title: "Amal qilish muddati".toUpperCase(),
                          inputHeight: getConfigHeight(0.06),
                          inputWidth: getConfigWidth(0.4),
                          placeholder: "",
                          controller: _vExpiredDate1,
                          inputType: TextInputType.number,
                        ),
                        TextInputForm(
                          titleHeight: getConfigHeight(0.05),
                          titleWidth: getConfigWidth(0.35),
                          title: "".toUpperCase(),
                          inputHeight: getConfigHeight(0.06),
                          inputWidth: getConfigWidth(0.35),
                          placeholder: "",
                          controller: _vExpiredDate2,
                          inputType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.4),
                  ),
                  SizedBox(
                    height: getConfigHeight(0.07),
                    width: getConfigWidth(0.8),
                    child: CustomButton(
                      name: "Qo'shish",
                      textSize: 18,
                      textColor: Colors.white,
                      radius: 15,
                      colorButton: Constants.primaryColor,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
