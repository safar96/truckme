import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:truckme/widget/component/custom_button.dart';

import '../../core/app_data/constants.dart';
import '../../core/component/size_config.dart';
import '../../core/util/map.dart';

class LocationSearch extends StatefulWidget {
  final Completer<GoogleMapController> mapController;
  final LatLng currentPosition;
  final TextEditingController controller;
  final void Function(LatLng) onTap;
  final void Function() onSelect;

  const LocationSearch({
    super.key,
    required this.mapController,
    required this.currentPosition,
    required this.onTap,
    required this.controller,
    required this.onSelect,
  });

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: "AIzaSyBsXQFuzKvlNAfC3QYz5Dg56m4w2Lfdqt4");
  List<Prediction> _searchResult = [];
  final provider = PlaceApiProvider("qwdwewqewqe");

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      height: getConfigFullHeight(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            height: getConfigHeight(0.5),
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
                const SizedBox(height: 20),
                Container(
                  width: 40,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD5DDE0),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: getConfigHeight(0.06),
                  width: getConfigWidth(0.9),
                  child: TextFormField(
                    controller: widget.controller,
                    onChanged: (v) {
                      _places.autocomplete(v).then((value) {
                        setState(() {
                          _searchResult = value.predictions;
                        });
                      });
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF7F8F9),
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
                const SizedBox(height: 10),
                SizedBox(
                  height: getConfigHeight(0.34) - 60,
                  width: getConfigWidth(0.9),
                  child: ListView.builder(
                    itemCount: _searchResult.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctn, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final placeDetail = await provider.getPlaceDetailFromId(_searchResult[index].placeId ?? "");
                              final currentPosition = LatLng(placeDetail.latitude, placeDetail.longitude);
                              widget.onTap(currentPosition);
                            },
                            behavior: HitTestBehavior.translucent,
                            child: SizedBox(
                              height: getConfigHeight(0.07),
                              child: Row(
                                children: [
                                  Container(
                                    width: getConfigWidth(0.1),
                                    height: getConfigHeight(0.05),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/ic_place.png"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: getConfigWidth(0.8),
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(_searchResult[index].description ?? ""),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: getConfigWidth(0.8) - 8,
                            alignment: Alignment.centerRight,
                            height: 1,
                            color: Constants.dividerColor,
                          )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: getConfigHeight(0.06),
                  width: getConfigWidth(0.8),
                  child: CustomButton(
                    radius: 15,
                    name: "Tastiqlash",
                    textSize: 18,
                    textColor: Constants.backgroundColor,
                    onTap: widget.onSelect,
                    colorButton: Constants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
