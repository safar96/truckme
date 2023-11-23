import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:truckme/core/component/size_config.dart';
import 'package:truckme/page/main/request_seccess_p.dart';
import 'package:truckme/widget/component/card_with_right.dart';
import 'package:truckme/widget/map/location_search.dart';
import '../../core/app_data/constants.dart';
import '../../core/util/map.dart';
import '../../model/card/card_list.dart';
import '../../widget/component/custom_button.dart';

class SpecialAutoMapP extends StatefulWidget {
  const SpecialAutoMapP({super.key});

  @override
  State<SpecialAutoMapP> createState() => _SpecialAutoMapPState();
}

class _SpecialAutoMapPState extends State<SpecialAutoMapP> {
  Completer<GoogleMapController> mapController = Completer();
  LatLng _currentPosition = const LatLng(41.299496, 69.240074);
  bool _isLoading = false;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylineList = {};
  List<LatLng> polylineCoordinates = [];
  String _mapTheme = "";
  final double _zoom = 18.0;
  final TextEditingController _searchController = TextEditingController();
  int _step = 1;
  bool _isShowMap = false;
  LatLng _firstLocation = const LatLng(41.299496, 69.240074);
  final provider = PlaceApiProvider("12345");
  CardList _selectedPayment = CardList(account: "****8295", card_type: "humo");

  final List<CardList> _cardList = [
    CardList(account: "****8295", card_type: "humo"),
    CardList(account: "****3704", card_type: "uzcard"),
    CardList(account: "Naqt", card_type: "Naqt"),
  ];

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString("assets/map_style.json").then((value) {
      _mapTheme = value;
    });
    _determinePosition();
  }


  Future<void> _determinePosition() async {
    setState(() {
      _isLoading = true;
    });
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    await Geolocator.getCurrentPosition().then((value) {
      setState(() {
        _currentPosition = LatLng(value.latitude, value.longitude);
      });
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  CameraPosition _cameraPosition() {
    return CameraPosition(
      target: _currentPosition,
      zoom: _zoom,
    );
  }

  void _decodeAddress(LatLng l) async {
    String currentAddress = "";
    try {
      setState(() {
        _isShowMap = true;
      });
      List list = await placemarkFromCoordinates(l.latitude, l.longitude);
      Placemark place1 = list[0];
      currentAddress = "${place1.name}, ${place1.subLocality}";
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        if (_step == 1) {
          _searchController.text = currentAddress;
        }
        _isShowMap = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: getConfigFullHeight(),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: getConfigFullHeight(),
                    child: GoogleMap(
                      onTap: (la) async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_step == 1) {
                          _currentPosition = la;
                          mapController.future.then((value) {
                            value.animateCamera(CameraUpdate.newLatLngZoom(la, _zoom));
                          });
                          _decodeAddress(la);
                        }
                        setState(() {});
                      },
                      onMapCreated: (controller) async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        await controller.setMapStyle(_mapTheme);
                        mapController.complete(controller);
                      },
                      onCameraMove: (m) async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (_step == 1) {
                          _currentPosition = m.target;
                          CameraUpdate.newCameraPosition(
                            _cameraPosition(),
                          );
                          _decodeAddress(m.target);
                        }
                        setState(() {});
                      },
                      initialCameraPosition: CameraPosition(target: _currentPosition, zoom: _zoom),
                      markers: {
                        Marker(
                          markerId: const MarkerId('one'),
                          position: _currentPosition,
                        )
                      },
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      compassEnabled: true,
                      indoorViewEnabled: true,
                      polylines: Set<Polyline>.of(polylineList.values),
                    ),
                  ),
                  SizedBox(
                    height: getConfigFullHeight(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getConfigTopHeight(),
                        ),
                        SizedBox(
                          height: getConfigHeight(0.08),
                          width: getConfigWidth(1),
                          child: Row(
                            children: [
                              Container(
                                height: getConfigHeight(0.05),
                                width: getConfigWidth(0.15),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: getConfigHeight(0.08),
                                width: getConfigWidth(0.7),
                                alignment: Alignment.center,
                                child: Text(
                                  "Manzilni tanlang",
                                  style: TextStyle(
                                    color:
                                    Theme.of(context).textTheme.titleSmall?.color,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getConfigHeight(0.08),
                                width: getConfigWidth(0.15),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        if (_step == 1 && _isShowMap == false)
                          LocationSearch(
                            mapController: mapController,
                            currentPosition: _currentPosition,
                            controller: _searchController,
                            onTap: (lat) async {
                              _firstLocation = lat;
                              await mapController.future.then((value) {
                                value.animateCamera(
                                  CameraUpdate.newLatLngZoom(lat, _zoom),
                                );
                              });
                              setState(() {});
                            },
                            onSelect: () {
                              _firstLocation = _currentPosition;
                              setState(() {
                                _step = 2;
                              });
                            },
                            onTapCurrentLocation: () {
                              _determinePosition();
                              CameraUpdate.newCameraPosition(
                                _cameraPosition(),
                              );
                            },
                          ),
                        if (_step == 2 && _isShowMap == false)
                          Container(
                            height: getConfigHeight(0.5) - 1,
                            width: getConfigWidth(1),
                            decoration: BoxDecoration(
                              color: Constants.backgroundColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 40),
                                const SizedBox(height: 20),
                                CardWithRight(
                                  height: getConfigHeight(0.07),
                                  width: getConfigWidth(0.8),
                                  imageUrl: _selectedPayment.card_type == "Naqt"
                                      ? "assets/images/ic_cash.png"
                                      : _selectedPayment.card_type == "humo"
                                      ? "assets/images/humo.png"
                                      : "assets/images/uzcard.png",
                                  title: _selectedPayment.account,
                                  onTap: () {
                                    setState(() {
                                      _step = 3;
                                    });
                                  },
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: getConfigHeight(0.07),
                                  width: getConfigWidth(0.8),
                                  child: CustomButton(
                                    radius: 15,
                                    name: "Tastiqlash",
                                    textSize: 18,
                                    textColor: Constants.backgroundColor,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RequestSuccessP(
                                            from: _searchController.text,
                                            to: "",
                                            isDelivery: false,
                                          ),
                                        ),
                                      );
                                    },
                                    colorButton: Constants.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (_step == 3 && _isShowMap == false)
                          Container(
                            height: getConfigHeight(0.3),
                            width: getConfigWidth(1),
                            decoration: BoxDecoration(
                              color: Constants.backgroundColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: getConfigWidth(0.8),
                                  height: getConfigHeight(0.05),
                                  child: const Text(
                                    "To'lov usulini tanlang",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: getConfigWidth(0.8),
                                  height: getConfigHeight(0.25) - 10,
                                  child: ListView.builder(
                                    itemCount: _cardList.length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          CardWithRight(
                                            height: getConfigHeight(0.07),
                                            width: getConfigWidth(0.8),
                                            imageUrl: _cardList[index].card_type == "Naqt"
                                                ? "assets/images/ic_cash.png"
                                                : _cardList[index].card_type == "humo"
                                                ? "assets/images/humo.png"
                                                : "assets/images/uzcard.png",
                                            title: _cardList[index].account,
                                            onTap: () {
                                              setState(() {
                                                _selectedPayment = _cardList[index];
                                                _step = 2;
                                              });
                                            },
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
    );
  }
}
