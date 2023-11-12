import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownModel {
  final int id;
  final String name;

  DropDownModel({
    required this.id,
    required this.name,
  });
}

class DropDownButton extends StatefulWidget {
  final double titleHeight;
  final double titleWidth;
  final String title;
  final double dropDownHeight;
  final double dropDownWidth;
  final void Function(DropDownModel?) onSelect;
  final List<DropDownModel> data;
  final DropDownModel initialData;

  const DropDownButton({
    super.key,
    required this.titleHeight,
    required this.titleWidth,
    required this.title,
    required this.dropDownHeight,
    required this.dropDownWidth,
    required this.onSelect,
    required this.data,
    required this.initialData,
  });

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
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
          height: widget.dropDownHeight,
          width: widget.dropDownWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8F9),
            border: Border.all(
              width: 1.0,
              color: const Color(0xFFD5DDE0)
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: DropdownButtonFormField2(
            value: widget.initialData,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              fillColor: Colors.transparent,
              focusedBorder: InputBorder.none,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              filled: false,
              alignLabelWithHint: false,
              enabled: false,
            ),
            isExpanded: true,
            hint: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            items: widget.data
                .map(
                  (item) => DropdownMenuItem<DropDownModel>(
                    value: item,
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).textTheme.titleSmall?.color,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: widget.onSelect,
            // onSaved: callback,
          ),
        ),
      ],
    );
  }
}
