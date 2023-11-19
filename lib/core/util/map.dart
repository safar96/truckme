import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PlaceDetail {
  String address;
  double latitude;
  double longitude;
  String name;

  PlaceDetail({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.name,
  });
}

class PlaceApiProvider {
  PlaceApiProvider(this.sessionToken);

  final String sessionToken;
  final apiKey = "AIzaSyBsXQFuzKvlNAfC3QYz5Dg56m4w2Lfdqt4";

  http.Request createGetRequest(String url) => http.Request('GET', Uri.parse(url));

  Future<PlaceDetail> getPlaceDetailFromId(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=formatted_address,name,geometry/location&key=$apiKey&sessiontoken=$sessionToken';
    var request = createGetRequest(url);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final result = json.decode(data);
      if (result['status'] == 'OK') {
        final place = PlaceDetail(
          address: result['result']['formatted_address'] ?? "",
          latitude: result['result']['geometry']['location']['lat'] ?? 0.0,
          longitude: result['result']['geometry']['location']['lng'] ?? 0.0,
          name: result['result']['geometry']['name'] ?? "",
        );
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<String?> getAddressFromLatLng(context, double lat, double lng) async {

    String host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$host?key=$apiKey&language=en&latlng=$lat,$lng';
      var response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String formattedAddress = data["results"][0]["formatted_address"];
        return formattedAddress;
      } else {
        return null;
      }
    }


  Future<void> getMapOrderInfo(LatLng from, LatLng to) async {
    String host = 'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&'
        'origins=${from.latitude},${from.longitude}&destinations=${to.latitude},${to.longitude}&key=$apiKey';
    var response = await http.get(Uri.parse(host));
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200) {
      Map data = jsonDecode(response.body);

    } else {

    }
  }
}
