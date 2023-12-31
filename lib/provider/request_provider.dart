import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:truckme/model/main/api_response.dart';
import 'package:truckme/model/main/application.dart';
import 'package:truckme/model/main/s_application.dart';
import 'package:truckme/provider/auth_provider.dart';
import '../core/app_data/global_class.dart';
import '../model/auth/success_message.dart';

class RequestProvider with ChangeNotifier {
  static const String api = "http://108.61.165.121/api/v1";

  Future<List<WorkType>> getWorkTypes() async {
    await AuthProvider().checkToken();
    String url = '$api/catalog/work-types';
    try {
      final response = await http.get(
        headers: {
          "Authorization": "Bearer ${Global.myUserInfo.token}",
          'Content-type': 'application/json; charset=utf-8',
          'Accept': 'application/json; charset=utf-8',
        },
        Uri.parse(url),
      );
      var resBody = json.decode(response.body);
      Iterable list = resBody["data"];
      List<WorkType> projectList = list.map((model) => WorkType.fromJson(model)).toList();
      return projectList;
    } catch (error) {
      print(error);
      return [];
    }
  }

  Future<List<VehicleType>> getVehicleTypes() async {
    await AuthProvider().checkToken();
    String url = '$api/catalog/vehicle-types/1';
    try {
      final response = await http.get(
        headers: {
          "Authorization": "Bearer ${Global.myUserInfo.token}",
          'Content-type': 'application/json; charset=utf-8',
          'Accept': 'application/json; charset=utf-8',
        },
        Uri.parse(url),
      );
      var resBody = json.decode(response.body);
      Iterable list = resBody["data"];
      List<VehicleType> projectList = list.map((model) => VehicleType.fromJson(model)).toList();
      return projectList;
    } catch (error) {
      print(error);
      return [];
    }
  }

  Future<SuccessMessage> sentRequest(Application application, LatLng from, LatLng to) async {
    await AuthProvider().checkToken();
    const url = "$api/applications";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Global.myUserInfo.token}",
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          "categoryId": application.categoryId,
          "vehicleTypeId": application.vehicleTypeId,
          "workTypeId": application.workTypeId,
          "sourceLatitude": from.latitude,
          "sourceLongitude": from.longitude,
          "targetLatitude": to.latitude,
          "targetLongitude": to.longitude,
          "description": application.description,
          "weight": application.weight,
          "dimension": application.height! * application.width! * application.depth!,
          "width": application.width,
          "height": application.height,
          "depth": application.depth,
          "distance": 0,
          "approxAmount": application.approxAmount,
          "loadDateTime": application.loadDateTime,
          "receiverPhone": application.receiverPhone,
          "directionType": application.directionType
        }),
      );
      var resBody = json.decode(response.body);
      if (resBody['success'] == true) {
        return SuccessMessage(Message.Succes, "");
      } else {
        return SuccessMessage(Message.Error, "Connection error");
      }
    } catch (error) {
      print(error);
      return SuccessMessage(Message.Error, "Connection error");
    }
  }


  Future<SuccessMessage> sentSpecialRequest(SApplication application, LatLng target) async {
    await AuthProvider().checkToken();
    const url = "$api/applications";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Global.myUserInfo.token}",
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          "categoryId": application.categoryId,
          "vehicleTypeId": application.vehicleTypeId,
          "workTypeId": application.workTypeId,
          "targetLatitude": target.latitude,
          "targetLongitude": target.longitude,
          "description": application.description,
          "distance": 0,
          "approxAmount": application.approxAmount,
          "loadDateTime": application.loadDateTime,
          "receiverPhone": application.receiverPhone,
        }),
      );
      var resBody = json.decode(response.body);
      if (resBody['success'] == true) {
        return SuccessMessage(Message.Succes, "");
      } else {
        return SuccessMessage(Message.Error, "Connection error");
      }
    } catch (error) {
      print(error);
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<SuccessMessage> canselApplication(int id) async {
    await AuthProvider().checkToken();
    var url = "$api/applications/cancel/$id";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${Global.myUserInfo.token}",
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return SuccessMessage(Message.Succes, "");
      } else {
        return SuccessMessage(Message.Error, "Connection error");
      }
    } catch (error) {
      print(error);
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<ApiResponse> getApplications() async {
    await AuthProvider().checkToken();
    String url = '$api/applications';
    try {
      final response = await http.get(
        headers: {
          "Authorization": "Bearer ${Global.myUserInfo.token}",
          'Content-type': 'application/json; charset=utf-8',
          'Accept': 'application/json; charset=utf-8',
        },
        Uri.parse(url),
      );
      var resBody = json.decode(response.body);
      return ApiResponse.fromJson(resBody);
    } catch (error) {
      print(error);
      return ApiResponse(success: false, data: []);
    }
  }
}
