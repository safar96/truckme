import 'package:flutter/material.dart';

class TextInputForm extends StatelessWidget {
  final double titleHeight;
  final double titleWidth;
  final String title;
  final double inputHeight;
  final double inputWidth;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType inputType;

  const TextInputForm({
    super.key,
    required this.titleHeight,
    required this.titleWidth,
    required this.title,
    required this.inputHeight,
    required this.inputWidth,
    required this.placeholder,
    required this.controller,
    required this.inputType,
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
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF7F8F9),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Color(0xFFD5DDE0),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Color(0xFFD5DDE0),
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Color(0xFFD5DDE0),
                ),
              ),
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                fontSize: 13,
                color: Color(0xFF3E4958),
              ),
              hintText: placeholder,
            ),
          ),
        ),
      ],
    );
  }
}
