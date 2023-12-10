import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckme/model/main/s_application.dart';
import 'package:truckme/page/main/special_auto_map_p.dart';
import 'package:truckme/widget/component/custom_button.dart';
import 'package:truckme/widget/component/date_input_form.dart';
import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import '../../model/main/api_response.dart';
import '../../provider/request_provider.dart';
import '../../widget/component/clock_input_form.dart';
import '../../widget/component/drop_down_button.dart';
import '../../widget/component/text_area_form.dart';
import '../../widget/component/text_input_form.dart';

class SpecialAutoRequestP extends StatefulWidget {
  const SpecialAutoRequestP({super.key});

  @override
  State<SpecialAutoRequestP> createState() => _SpecialAutoRequestPState();
}

class _SpecialAutoRequestPState extends State<SpecialAutoRequestP> {
  List<WorkType> _workTypes = [];
  List<VehicleType> _vehicleTypes = [];
  bool _isLoading = false;
  final List<DropDownModel> _listWorkType = [];
  final List<DropDownModel> _listVehicleType = [];
  DropDownModel _carType = DropDownModel(id: 1, name: "test1");
  DropDownModel _baggageType = DropDownModel(id: 1, name: "test1");
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
    _carType = _listVehicleType.first;
    _baggageType = _listWorkType.first;
    _phone = pref.getString("phone")!;
    setState(() {});
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


  final TextEditingController _amount = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _description = TextEditingController();

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
                          "Maxsus transport",
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
                        data: _listVehicleType,
                        initialData: _carType,
                      ),
                      DropDownButton(
                        titleHeight: getConfigHeight(0.05),
                        titleWidth: getConfigWidth(0.8),
                        title: "ish turlari".toUpperCase(),
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
                      TextInputForm(
                        titleHeight: getConfigHeight(0.05),
                        titleWidth: getConfigWidth(0.8),
                        title: "Narxi",
                        inputHeight: getConfigHeight(0.06),
                        inputWidth: getConfigWidth(0.8),
                        placeholder: "",
                        controller: _amount,
                        inputType: TextInputType.number,
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
                        child: TextAreaForm(
                          titleHeight: getConfigHeight(0.05),
                          titleWidth: getConfigWidth(0.8),
                          title: "tavsifi".toUpperCase(),
                          inputHeight: getConfigHeight(0.15),
                          inputWidth: getConfigWidth(0.8),
                          controller: _description,
                        ),
                      ),
                      SizedBox(
                        height: getConfigHeight(0.17),
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
                            final app = SApplication(
                              categoryId: 2,
                              vehicleTypeId: _carType.id,
                              workTypeId: _baggageType.id,
                              description: _description.text,
                              approxAmount: double.parse(_amount.text),
                              loadDateTime: "${_date.text.replaceAll("-", ".")} ${_time.text}:00",
                              receiverPhone: _phone,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SpecialAutoMapP(
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
