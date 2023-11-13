import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ClockInputForm extends StatefulWidget {
  final double titleHeight;
  final double titleWidth;
  final String title;
  final double inputHeight;
  final double inputWidth;
  final TextEditingController controller;

  const ClockInputForm({
    super.key,
    required this.titleHeight,
    required this.titleWidth,
    required this.title,
    required this.inputHeight,
    required this.inputWidth,
    required this.controller,
  });

  @override
  State<ClockInputForm> createState() => _ClockInputFormState();
}

class _ClockInputFormState extends State<ClockInputForm> {
  void _getDate() async {
    TimeOfDay? pickedDate = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text = "${pickedDate.hour}:${pickedDate.minute}";
      });
    }
  }

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
        Container(
          height: widget.inputHeight,
          width: widget.inputWidth,
          alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: widget.controller,
            readOnly: true,
            onTap: _getDate,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFF7F8F9),
              contentPadding: EdgeInsets.only(bottom: 10,left: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Color(0xFFD5DDE0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Color(0xFFD5DDE0),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  width: 1.0,
                  color: Color(0xFFD5DDE0),
                ),
              ),
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                fontSize: 13,
                color: Color(0xFF3E4958),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
