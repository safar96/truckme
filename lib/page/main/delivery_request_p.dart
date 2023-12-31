import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckme/model/main/application.dart';
import 'package:truckme/page/main/delivery_map_p.dart';
import 'package:truckme/provider/request_provider.dart';
import 'package:truckme/widget/component/check_box_custom.dart';
import 'package:truckme/widget/component/custom_button.dart';
import 'package:truckme/widget/component/date_input_form.dart';
import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import '../../model/main/api_response.dart';
import '../../widget/component/clock_input_form.dart';
import '../../widget/component/drop_down_button.dart';
import '../../widget/component/text_area_form.dart';
import '../../widget/component/text_input_form.dart';

class DeliveryRequestP extends StatefulWidget {
  final bool isNew;
  final DataItem? dataItem;

  const DeliveryRequestP({
    super.key,
    required this.isNew,
    this.dataItem,
  });

  @override
  State<DeliveryRequestP> createState() => _DeliveryRequestPState();
}

class _DeliveryRequestPState extends State<DeliveryRequestP> {
  DropDownModel _carType = DropDownModel(id: 1, name: "test1");
  DropDownModel _baggageType = DropDownModel(id: 1, name: "test1");
  final TextEditingController _volume1 = TextEditingController();
  final TextEditingController _volume2 = TextEditingController();
  final TextEditingController _volume3 = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _description = TextEditingController();
  bool _isInTown = true;
  List<WorkType> _workTypes = [];
  List<VehicleType> _vehicleTypes = [];
  bool _isLoading = false;
  final List<DropDownModel> _listWorkType = [];
  final List<DropDownModel> _listVehicleType = [];
  String _phone = "";

  Future<void> _getInfo() async {
    final provider = Provider.of<RequestProvider>(context, listen: false);
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
    });
    _workTypes = await provider.getWorkTypes();
    _vehicleTypes = await provider.getVehicleTypes();
    for (WorkType w in _workTypes) {
      _listWorkType.add(DropDownModel(id: w.id, name: w.vehicleTypeNameCyril));
    }
    for (VehicleType w in _vehicleTypes) {
      _listVehicleType.add(DropDownModel(id: w.id, name: w.vehicleTypeNameCyril));
    }
    _phone = pref.getString("phone")!;
    if(widget.isNew){
      _carType = _listVehicleType.first;
      _baggageType = _listWorkType.first;
    }else{
      await _setValue();
    }

    setState(() {});
  }

  Future<void> _setValue() async {
    DataItem? app = widget.dataItem;
    _volume1.text = app!.depth.toString();
    _volume2.text = app.height.toString();
    _volume3.text = app.width.toString();
    _amount.text = app.approxAmount.toString();
    _weight.text = app.weight.toString();
    _description.text = app.description;
    _carType = _listVehicleType.firstWhere((element) => element.id == app.vehicleType.id);
    _baggageType = _listWorkType.firstWhere((element) => element.id== app.workType.id);
  }

  @override
  void initState() {
    _getInfo().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
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
                      if (_listVehicleType.isNotEmpty)
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
                          data: _listVehicleType,
                          initialData: _carType,
                        ),
                      if (_listWorkType.isNotEmpty)
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
                          data: _listWorkType,
                          initialData: _baggageType,
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
                              titleHeight: getConfigHeight(0.05),
                              titleWidth: getConfigWidth(0.2),
                              title: "Uzunligi",
                              inputHeight: getConfigHeight(0.06),
                              inputWidth: getConfigWidth(0.2),
                              placeholder: "",
                              controller: _volume1,
                              inputType: TextInputType.number,
                            ),
                            TextInputForm(
                              titleHeight: getConfigHeight(0.05),
                              titleWidth: getConfigWidth(0.2),
                              title: "Bo'yi",
                              inputHeight: getConfigHeight(0.06),
                              inputWidth: getConfigWidth(0.2),
                              placeholder: "",
                              controller: _volume2,
                              inputType: TextInputType.number,
                            ),
                            TextInputForm(
                              titleHeight: getConfigHeight(0.05),
                              titleWidth: getConfigWidth(0.2),
                              title: "Eni",
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
                              title: "Narxi".toUpperCase(),
                              inputHeight: getConfigHeight(0.06),
                              inputWidth: getConfigWidth(0.35),
                              placeholder: "",
                              controller: _amount,
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
                              onTap: () {
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
                              onTap: () {
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
                            final app = Application(
                                categoryId: 1,
                                vehicleTypeId: _carType.id,
                                workTypeId: _baggageType.id,
                                description: _description.text,
                                weight: double.parse(_weight.text),
                                width: double.parse(_volume3.text),
                                height: double.parse(_volume2.text),
                                depth: double.tryParse(_volume1.text),
                                approxAmount: double.parse(_amount.text),
                                loadDateTime: "${_date.text.replaceAll("-", ".")} ${_time.text}:00",
                                receiverPhone: _phone,
                                directionType: _isInTown ? "CITY" : "INTERURBAN");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeliveryMapP(
                                  application: app,
                                ),
                              ),
                            );
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
