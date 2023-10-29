import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

class PhoneInputForm extends StatelessWidget {
  final double titleHeight;
  final double titleWidth;
  final String title;
  final double inputHeight;
  final double inputWidth;
  final String placeholder;
  final TextEditingController controller;

  const PhoneInputForm({
    super.key,
    required this.titleHeight,
    required this.titleWidth,
    required this.title,
    required this.inputHeight,
    required this.inputWidth,
    required this.placeholder,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: titleHeight,
          width: titleWidth,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF3E4958),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: inputHeight,
          width: inputWidth,
          child: TextField(
            textInputAction: TextInputAction.done,
            keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
            inputFormatters: [
              MaskedInputFormatter(
                '##-###-##-##',
                allowedCharMatcher: RegExp(r'\d'),
              )
            ],
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF3E4958),
            ),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              filled: true,
              fillColor: const Color(0xFFF7F8F9),
              contentPadding: EdgeInsets.zero,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              prefixIcon: Container(
                height: inputHeight,
                width: 40,
                alignment: Alignment.center,
                child: const Text(
                  "+998 ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF3E4958),
                  ),
                ),
              ),
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Color(0xFF3E4958),
              ),
              hintText: placeholder,
            ),
            onChanged: (v) {
              if (v.length == 12) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            onTapOutside: (val) {},
            controller: controller,
          ),
        ),
      ],
    );
  }
}
