import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/core/util/map.dart';
import 'package:truckme/core/util/util_file.dart';
import 'package:truckme/model/auth/success_message.dart';
import 'package:truckme/model/main/api_response.dart';
import 'package:truckme/provider/request_provider.dart';
import '../../widget/component/custom_button.dart';
import '../../widget/component/icon_button_custom.dart';
import '../../widget/component/svg_button.dart';
import '../drawer/drawer_p.dart';
import 'delivery_request_p.dart';
import 'main_add_p.dart';

class MainNew extends StatefulWidget {
  const MainNew({super.key});

  @override
  State<MainNew> createState() => _MainNewState();
}

class AddressInfo {
  final String from;
  final String to;

  AddressInfo({required this.from, required this.to});
}

class _MainNewState extends State<MainNew> {
  bool _isNew = true;
  bool _isDelivery = true;
  int _showId = -1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  bool _isCanselLoading = false;
  late ApiResponse _apiResponse;
  List<DataItem> _newDeliveryList = [];
  List<DataItem> _activeDeliveryList = [];
  List<DataItem> _newOrderList = [];
  List<DataItem> _activeOrderList = [];

  void _getInfo() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await Provider.of<RequestProvider>(context, listen: false).getApplications();

    if (_apiResponse.success && _apiResponse.data.isNotEmpty) {
      final deliveryList = _apiResponse.data.where((element) => element.vehicleCategory.id == 1).toList();
      final orderList = _apiResponse.data.where((element) => element.vehicleCategory.id == 2).toList();
      _newDeliveryList = deliveryList.where((element) => element.status == "NEW").toList();
      _activeDeliveryList = deliveryList.where((element) => element.status != "NEW").toList();
      _newOrderList = orderList.where((element) => element.status == "NEW").toList();
      _activeOrderList = orderList.where((element) => element.status != "NEW").toList();
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<AddressInfo?> _getAddress(fLat, fLong, tLat, tLong) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      fLat,
      fLong,
    );
    List<Placemark> placemarksTo = await placemarkFromCoordinates(
      tLat,
      tLong,
    );
    return AddressInfo(from: placemarks.first.name ?? "", to: placemarksTo.first.name ?? "");
  }

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  void _canselApplication(int id) async {
    setState(() {
      _isCanselLoading = true;
    });
    SuccessMessage message = await Provider.of<RequestProvider>(context, listen: false).canselApplication(id);
    if (message.message == Message.Succes) {
      _getAlert("Muvafiqiyat", "Muvafiqiyatli o'chirildi");
      _getInfo();
    } else {
      _getAlert("Xatolik", message.body);
    }
    setState(() {
      _isCanselLoading = false;
    });
  }

  void _getAlert(title, body) {
    alert(context, "Muvafiqiyat", "Muvafiqiyatli o'chirildi");
  }

  Widget _getList(List<DataItem> list) {
    return list.isEmpty
        ? SizedBox(
            height: getConfigHeight(0.68),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/order.png',
                  scale: 3,
                ),
                const Text(
                  'Buyurtmalar mavjud emas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: list.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return FutureBuilder<AddressInfo>(
                  future: _getAddress(list[index].sourceLatitude, list[index].sourceLongitude,
                          list[index].targetLatitude, list[index].targetLongitude)
                      .then((location) {
                    AddressInfo(from: location!.from, to: location.to);

                    return location;
                  }),
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        height: _showId == list[index].id ? getConfigHeight(0.7) : getConfigHeight(0.2),
                        width: getConfigWidth(0.9),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: _showId == list[index].id ? getConfigHeight(0.68) : getConfigHeight(0.18),
                              width: getConfigWidth(0.9),
                              alignment: Alignment.topCenter,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getConfigHeight(0.06),
                                    width: getConfigWidth(0.8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "№${list[index].id}",
                                          style: TextStyle(
                                            color: Constants.unSelectColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "5 soat",
                                          style: TextStyle(
                                            color: Constants.unSelectColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getConfigHeight(0.12),
                                    width: getConfigWidth(0.8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Container(
                                        //   height: getConfigHeight(0.09),
                                        //   width: getConfigWidth(0.2),
                                        //   decoration: const BoxDecoration(
                                        //     color: Color(0xFFD9D9D9),
                                        //     borderRadius: BorderRadius.all(
                                        //       Radius.circular(15),
                                        //     ),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          height: getConfigHeight(0.12),
                                          // width: getConfigWidth(0.25),
                                          width: getConfigWidth(0.45),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  list[index].vehicleCategory.categoryNameCyril,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Constants.textBlackColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  list[index].workType.vehicleTypeNameCyril,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    color: Constants.textBlackColor,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  "${list[index].weight} kg",
                                                  style: TextStyle(
                                                    color: Constants.textBlackColor,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: getConfigHeight(0.1),
                                          width: getConfigWidth(0.35),
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "${list[index].approxAmount} so’m",
                                            style: TextStyle(
                                              color: Constants.textBlackColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_showId == list[index].id)
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: getConfigHeight(0.05),
                                          width: getConfigWidth(0.8),
                                          child: Text(
                                            "Manzil",
                                            style: TextStyle(
                                              color: Constants.textBlackColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.12),
                                          width: getConfigWidth(0.8),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: getConfigHeight(0.11),
                                                width: getConfigWidth(0.15),
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/ic_route.png"),
                                                    scale: 2.2,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: getConfigHeight(0.12),
                                                width: getConfigWidth(0.65),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data?.from ?? "",
                                                      style: TextStyle(
                                                        color: Constants.textBlackColor,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data?.to ?? "",
                                                      style: TextStyle(
                                                        color: Constants.textBlackColor,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.02),
                                        ),
                                        Container(
                                          height: 2,
                                          width: getConfigWidth(0.8),
                                          color: Constants.unSelectColor,
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.07),
                                          width: getConfigWidth(0.8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Masofa",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "${list[index].distance} km",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 2,
                                          width: getConfigWidth(0.8),
                                          color: Constants.unSelectColor,
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.07),
                                          width: getConfigWidth(0.8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "To’lov turi",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "Naqt",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 2,
                                          width: getConfigWidth(0.8),
                                          color: Constants.unSelectColor,
                                        ),
                                        SizedBox(
                                          height: getConfigHeight(0.07),
                                          width: getConfigWidth(0.8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Yuklash sanasi",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                "10.10.2023 15:45",
                                                style: TextStyle(
                                                  color: Constants.textBlackColor,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (list[index].status == "NEW")
                                          SizedBox(
                                            height: getConfigHeight(0.08),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  height: getConfigHeight(0.06),
                                                  width: getConfigWidth(0.35),
                                                  child: _isCanselLoading
                                                      ? const Center(
                                                          child: CircularProgressIndicator(),
                                                        )
                                                      : CustomButton(
                                                          radius: 15,
                                                          name: "Bekor qilish",
                                                          textSize: 15,
                                                          textColor: Colors.white,
                                                          onTap: () {
                                                            _canselApplication(list[index].id);
                                                          },
                                                          colorButton: const Color(0xFFB60D0D),
                                                        ),
                                                ),
                                                SizedBox(
                                                  height: getConfigHeight(0.06),
                                                  width: getConfigWidth(0.35),
                                                  child: CustomButton(
                                                    radius: 15,
                                                    name: "O’zgartirish",
                                                    textSize: 15,
                                                    textColor: Constants.textBlackColor,
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => DeliveryRequestP(
                                                            isNew: false,
                                                            dataItem: DataItem(
                                                              id: list[index].id,
                                                              vehicleCategory: list[index].vehicleCategory,
                                                              vehicleType: list[index].vehicleType,
                                                              workType: list[index].workType,
                                                              sourceLatitude: list[index].sourceLatitude,
                                                              sourceLongitude: list[index].sourceLongitude,
                                                              targetLatitude: list[index].targetLatitude,
                                                              targetLongitude: list[index].targetLongitude,
                                                              description: list[index].description,
                                                              dimension: list[index].dimension,
                                                              width: list[index].width,
                                                              height: list[index].height,
                                                              depth: list[index].depth,
                                                              weight: list[index].weight,
                                                              distance: list[index].distance,
                                                              approxAmount: list[index].approxAmount,
                                                              receiverPhone: list[index].receiverPhone,
                                                              status: list[index].status,
                                                              directionType: list[index].directionType,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    colorButton: const Color(0xFFFFFFFF),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: _showId == list[index].id ? getConfigHeight(0.65) : getConfigHeight(0.15),
                                ),
                                IconButtonCustom(
                                  height: getConfigHeight(0.05),
                                  width: getConfigWidth(0.2),
                                  url: _showId == list[index].id
                                      ? "assets/images/ic_arrow_top.png"
                                      : "assets/images/ic_arrow.png",
                                  onTap: () {
                                    setState(() {
                                      if (_showId == list[index].id) {
                                        _showId = -1;
                                      } else {
                                        _showId = list[index].id;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
        height: getConfigFullHeight(),
        child: Column(
          children: [
            Container(
              height: getConfigTopHeight(),
              color: Constants.primaryColor,
            ),
            Container(
              height: getConfigHeight(0.07),
              alignment: Alignment.bottomLeft,
              color: Constants.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getConfigWidth(0.15),
                    child: SvgButton(
                      imageUrl: "assets/icons/drawer.svg",
                      height: 75,
                      width: 75,
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                  ),
                  SizedBox(
                    width: getConfigWidth(0.7),
                    child: const Center(
                      child: Text(
                        "TruckMe",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getConfigHeight(0.06),
              child: Stack(
                children: [
                  Container(
                    height: getConfigHeight(0.04),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius:
                          const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                    ),
                  ),
                  Positioned(
                    top: getConfigHeight(0.01),
                    left: getConfigWidth(0.1),
                    child: SizedBox(
                      height: getConfigHeight(0.05),
                      width: getConfigWidth(0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDelivery = true;
                              });
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              height: double.infinity,
                              width: getConfigWidth(0.38),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _isDelivery ? Constants.primaryColor : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: Text(
                                'Yuk tashish',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _isDelivery ? Colors.white : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDelivery = false;
                              });
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              height: double.infinity,
                              width: getConfigWidth(0.38),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: !_isDelivery ? Constants.primaryColor : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: Text(
                                'Maxsus texnika',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: !_isDelivery ? Colors.white : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getConfigHeight(0.01)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  _isNew = true;
                });
              },
              child: SizedBox(
                height: getConfigHeight(0.05),
                width: getConfigWidth(0.9),
                child: Row(
                  children: [
                    SizedBox(
                      height: getConfigHeight(0.05),
                      width: getConfigWidth(0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: getConfigHeight(0.046),
                            width: getConfigWidth(0.3),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0.0),
                              child: Text(
                                "Yangi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: _isNew ? Constants.primaryColor : Constants.unSelectColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getConfigHeight(0.004),
                            width: getConfigWidth(0.3),
                            decoration: BoxDecoration(
                              color: _isNew ? Constants.primaryColor : Constants.unSelectColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          _isNew = false;
                        });
                      },
                      child: SizedBox(
                        height: getConfigHeight(0.05),
                        width: getConfigWidth(0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getConfigHeight(0.046),
                              width: getConfigWidth(0.3),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Text(
                                  "Active",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: !_isNew ? Constants.primaryColor : Constants.unSelectColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: getConfigHeight(0.004),
                              width: getConfigWidth(0.3),
                              decoration: BoxDecoration(
                                color: !_isNew ? Constants.primaryColor : Constants.unSelectColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: getConfigWidth(0.28),
                      alignment: Alignment.bottomRight,
                      child: IconButtonCustom(
                        height: getConfigHeight(0.045),
                        width: getConfigWidth(0.15),
                        url: "assets/images/lucide_filter.png",
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: getConfigHeight(0.01)),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: getConfigHeight(0.68),
                    width: getConfigWidth(1),
                    alignment: Alignment.topCenter,
                    child: _isDelivery
                        ? _isNew
                            ? _getList(_newDeliveryList)
                            : _getList(_activeDeliveryList)
                        : _isNew
                            ? _getList(_newOrderList)
                            : _getList(_activeOrderList),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MainAddP(),
          ));
        },
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: getConfigHeight(0.04),
          child: Image.asset('assets/images/add.png'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: getConfigHeight(0.075),
        shape: const CircularNotchedRectangle(),
        color: Constants.primaryColor,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: const DrawerP(),
    );
  }
}
