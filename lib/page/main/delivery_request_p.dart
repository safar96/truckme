import 'package:flutter/material.dart';
import 'package:truckme/page/main/map_p.dart';
import 'package:truckme/widget/component/check_box_custom.dart';
import 'package:truckme/widget/component/custom_button.dart';
import 'package:truckme/widget/component/date_input_form.dart';
import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import '../../widget/component/clock_input_form.dart';
import '../../widget/component/drop_down_button.dart';
import '../../widget/component/text_area_form.dart';
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

  DropDownModel _carType = DropDownModel(id: 1, name: "test1");
  DropDownModel _baggageType = DropDownModel(id: 1, name: "test1");
  final TextEditingController _volume1 = TextEditingController();
  final TextEditingController _volume2 = TextEditingController();
  final TextEditingController _volume3 = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _count = TextEditingController();
  final TextEditingController _description = TextEditingController();
  bool _isInTown = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SizedBox(
          height: getConfigFullHeight(),
          child: SingleChildScrollView(
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
                  titleWidth: getConfigWidth(0.8),
                  title: "Avtomabil turi".toUpperCase(),
                  dropDownHeight: getConfigHeight(0.07),
                  dropDownWidth: getConfigWidth(0.8),
                  onSelect: (m) {
                    setState(() {
                      _carType = m!;
                    });
                  },
                  data: _list,
                  initialData: _list.first,
                ),
                DropDownButton(
                  titleHeight: getConfigHeight(0.05),
                  titleWidth: getConfigWidth(0.8),
                  title: "yuk turlari".toUpperCase(),
                  dropDownHeight: getConfigHeight(0.07),
                  dropDownWidth: getConfigWidth(0.8),
                  onSelect: (m) {
                    setState(() {
                      _baggageType = m!;
                    });
                  },
                  data: _list,
                  initialData: _list.first,
                ),
                Container(
                  height: getConfigHeight(0.05),
                  width: getConfigWidth(0.8),
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
                  width: getConfigWidth(0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextInputForm(
                        titleHeight: getConfigHeight(0.0),
                        titleWidth: getConfigWidth(0.0),
                        title: "",
                        inputHeight: getConfigHeight(0.06),
                        inputWidth: getConfigWidth(0.2),
                        placeholder: "",
                        controller: _volume1,
                        inputType: TextInputType.number,
                      ),
                      TextInputForm(
                        titleHeight: getConfigHeight(0.0),
                        titleWidth: getConfigWidth(0.0),
                        title: "",
                        inputHeight: getConfigHeight(0.06),
                        inputWidth: getConfigWidth(0.2),
                        placeholder: "",
                        controller: _volume2,
                        inputType: TextInputType.number,
                      ),
                      TextInputForm(
                        titleHeight: getConfigHeight(0.0),
                        titleWidth: getConfigWidth(0.0),
                        title: "",
                        inputHeight: getConfigHeight(0.06),
                        inputWidth: getConfigWidth(0.2),
                        placeholder: "",
                        controller: _volume3,
                        inputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getConfigWidth(0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateInputForm(
                        titleHeight: getConfigHeight(0.05),
                        titleWidth: getConfigWidth(0.35),
                        title: "Sanasi".toUpperCase(),
                        inputHeight: getConfigHeight(0.06),
                        inputWidth: getConfigWidth(0.35),
                        controller: _date,
                      ),
                      SizedBox(width: getConfigWidth(0.1)),
                      ClockInputForm(
                        titleHeight: getConfigHeight(0.05),
                        titleWidth: getConfigWidth(0.35),
                        title: "Vaqti".toUpperCase(),
                        inputHeight: getConfigHeight(0.06),
                        inputWidth: getConfigWidth(0.35),
                        controller: _time,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getConfigWidth(0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextInputForm(
                        titleHeight: getConfigHeight(0.05),
                        titleWidth: getConfigWidth(0.35),
                        title: "Og'irligi".toUpperCase(),
                        inputHeight: getConfigHeight(0.06),
                        inputWidth: getConfigWidth(0.35),
                        placeholder: "",
                        controller: _weight,
                        inputType: TextInputType.number,
                      ),
                      SizedBox(width: getConfigWidth(0.1)),
                      TextInputForm(
                        titleHeight: getConfigHeight(0.05),
                        titleWidth: getConfigWidth(0.35),
                        title: "Miqdori".toUpperCase(),
                        inputHeight: getConfigHeight(0.06),
                        inputWidth: getConfigWidth(0.35),
                        placeholder: "",
                        controller: _count,
                        inputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getConfigWidth(0.8),
                  child: TextAreaForm(
                    titleHeight: getConfigHeight(0.05),
                    titleWidth: getConfigWidth(0.8),
                    title: "tavsifi".toUpperCase(),
                    inputHeight: getConfigHeight(0.1),
                    inputWidth: getConfigWidth(0.8),
                    controller: _description,
                  ),
                ),
                SizedBox(
                  width: getConfigWidth(0.8),
                  height: getConfigHeight(0.08),
                  child: Row(
                    children: [
                      CheckBoxCustom(
                        height: getConfigHeight(0.08),
                        width: getConfigWidth(0.4),
                        title: "shahar ichida".toUpperCase(),
                        isSelected: _isInTown,
                        onTap: (){
                          setState(() {
                            _isInTown = true;
                          });
                        },
                      ),
                      CheckBoxCustom(
                        height: getConfigHeight(0.08),
                        width: getConfigWidth(0.4),
                        title: "shaharlar aro".toUpperCase(),
                        isSelected: !_isInTown,
                        onTap: (){
                          setState(() {
                            _isInTown = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getConfigHeight(0.07),
                  width: getConfigWidth(0.8),
                  child: CustomButton(
                    name: "Keyingisi",
                    textSize: 18,
                    textColor: Colors.white,
                    radius: 15,
                    colorButton: Constants.primaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapP(),
                        ),
                      );
                      // _register();
                    },
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
