import 'package:flutter/material.dart';

class PasswordInputForm extends StatefulWidget {
  final double titleHeight;
  final double titleWidth;
  final String title;
  final double inputHeight;
  final double inputWidth;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType inputType;

  const PasswordInputForm({
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
  State<PasswordInputForm> createState() => _PasswordInputFormState();
}

class _PasswordInputFormState extends State<PasswordInputForm> {
  bool _isNotVisiable = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.titleHeight,
          width: widget.titleWidth,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            widget.title.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF3E4958),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: widget.inputHeight,
          width: widget.inputWidth,
          child: TextFormField(
            obscureText: _isNotVisiable,
            controller: widget.controller,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  _isNotVisiable ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF97ADB6)
                ),
                onPressed: () {
                  setState(() {
                    _isNotVisiable = !_isNotVisiable;
                  });
                },
              ),
              filled: true,
              fillColor: const Color(0xFFF7F8F9),
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
              alignLabelWithHint: true,
              hintStyle: const TextStyle(
                fontSize: 13,
                color: Color(0xFF3E4958),
              ),
              hintText: widget.placeholder,
            ),
          ),
        ),
      ],
    );
  }
}
