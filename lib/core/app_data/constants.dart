import 'package:flutter/material.dart';

class Constants{

  static Color backgroundColor = const Color(0xFFFFFFFF);
  static Color backgroundColor2 = const Color(0xFFFAFAFA);
  static Color primaryColor = const Color(0xFF0DB65B);
  static Color secondaryColor = const Color(0xFF0BB057);
  static Color unSelectColor = const Color(0xFFDAE0E6);
  static Color textBlackColor = const Color(0xFF3E4958);
  static Color dividerColor = const Color(0xFFD5DDE0);

  static String mapStyles = '''[
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]''';
}