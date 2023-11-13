import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DateInputForm extends StatefulWidget {
  final double titleHeight;
  final double titleWidth;
  final String title;
  final double inputHeight;
  final double inputWidth;
  final TextEditingController controller;

  const DateInputForm({
    super.key,
    required this.titleHeight,
    required this.titleWidth,
    required this.title,
    required this.inputHeight,
    required this.inputWidth,
    required this.controller,
  });

  @override
  State<DateInputForm> createState() => _DateInputFormState();
}

class _DateInputFormState extends State<DateInputForm> {
  void _getDate() async {

    String code = context.locale.languageCode;
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      locale: context.locale,
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy', code).format(pickedDate);
      setState(() {
        widget.controller.text = formattedDate;
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
