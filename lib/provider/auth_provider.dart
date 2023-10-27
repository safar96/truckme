import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/app_data/global_class.dart';
import '../core/database/init_database.dart';
import '../core/database/user_session_table.dart';
import '../model/auth/success_message.dart';
import '../model/user/session.dart';
import '../model/user/success_message_user.dart';
import '../model/user/user_info.dart';
import '../model/user/user_session.dart';

class AuthProvider with ChangeNotifier {

  Future<SuccessMessage> phoneRequest(String phone, String tag) async {
    final prefs = await SharedPreferences.getInstance();
    const url = 'https://api.xpertmedia.uz/auth/v1/otp/request';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "phone_number": phone,
          "tag": tag,
        }),
      );
      var resBody = json.decode(response.body);
      if (response.statusCode == 202) {
        prefs.setString("sms_id", resBody['data']['sms_id']);
        prefs.setString("phone", phone);
        return SuccessMessage(Message.Login, "");
      } else if (response.statusCode == 404) {
        prefs.setString("phone", phone);
        return SuccessMessage(Message.Register, "");
      }
      return SuccessMessage(Message.Error, resBody['data']);
    } catch (error) {
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<SuccessMessage> registerUser(String firstName, String lastName, String tag) async {
    final prefs = await SharedPreferences.getInstance();
    String? phone = prefs.getString("phone");
    const url = 'https://api.xpertmedia.uz/auth/v1/register';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "first_name": firstName,
          "last_name": lastName,
          "password": "",
          "phone_number": phone,
          "user_type": 0,
          "tag": tag,
        }),
      );
      var resBody = json.decode(response.body);
      if (response.statusCode == 202) {
        return SuccessMessage(Message.Login, "");
      } else {
        return SuccessMessage(Message.Error, resBody['data']);
      }
    } catch (error) {
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<SuccessMessage> smsConfirm(String code) async {
    final prefs = await SharedPreferences.getInstance();
    String? phone = prefs.getString("phone");
    String? smsId = prefs.getString("sms_id");
    const url = 'https://api.xpertmedia.uz/auth/v1/otp/confirm';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "code": code,
          "phone_number": phone,
          "sms_id": smsId,
        }),
      );
      var resBody = json.decode(response.body);

      if (response.statusCode == 200) {
        await addUserSession(
          resBody['data']['user']['id'],
          resBody['data']['token']['access_token'],
          resBody['data']['token']['refresh_token'],
        );
        Global.myUserInfo = UserInfo.fromJson(
          resBody['data']['user'],
          resBody['data']['token']['access_token'],
          resBody['data']['token']['refresh_token'],
        );
        final String encodedData = Session.encode(resBody['data']['sessions'].map<Session>((document) {
          return Session(
            id: document['id'],
            ip: document['ip'],
            user_id: document['user_id'],
            expires_at: document['expires_at'],
          );
        }).toList());
        await prefs.setString('session_key', encodedData);
        return SuccessMessage(Message.Succes, "");
      }
      return SuccessMessage(Message.Error, resBody['data']);
    } catch (error) {
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<bool> logOut() async {
    InitDatabase initDatabase = InitDatabase();
    UserSessionTable userSessionTable = UserSessionTable();
    await initDatabase.initializedDB().whenComplete(() async {
      await userSessionTable.deleteUserSession();
    });
    await checkToken();
    const url = 'https://api.xpertmedia.uz/auth/v1/logout';
    try {
      await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${Global.myUserInfo.token}',
        },
      );
      InitDatabase initDatabase = InitDatabase();
      UserSessionTable userSessionTable = UserSessionTable();
      await initDatabase.initializedDB().whenComplete(() async {
        await userSessionTable.deleteUserSession();
      });

      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> deleteProfile() async {
    await checkToken();
    const url = 'https://api.xpertmedia.uz/spec/v1/user';
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${Global.myUserInfo.token}',
        },
      );
      if (response.statusCode == 200) {
        InitDatabase initDatabase = InitDatabase();
        UserSessionTable userSessionTable = UserSessionTable();
        await initDatabase.initializedDB().whenComplete(() async {
          await userSessionTable.deleteUserSession();
        });
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<SuccessMessage> deleteSession(String sessionId) async {
    await checkToken();
    String url = 'https://api.xpertmedia.uz/auth/v1/session/$sessionId';
    try {
      final response = await http.delete(Uri.parse(url), headers: {"Authorization": "Bearer ${Global.myUserInfo.token}"});
      if (response.statusCode == 200) {
        return SuccessMessage(Message.Succes, "");
      } else {
        var resBody = json.decode(response.body);
        return SuccessMessage(Message.Error, resBody['data']);
      }
    } catch (error) {
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<SuccessMessage> sentImage(File file) async {
    await checkToken();
    Map<String, String> headers = {"Authorization": "Bearer ${Global.myUserInfo.token}"};
    const url = 'https://api.xpertmedia.uz/spec/v1/image-upload';
    try {
      final request = http.MultipartRequest('Post', Uri.parse(url));
      request.headers.addAll(headers);
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          File(file.path).readAsBytesSync(),
          filename: file.path,
        ),
      );
      var res = await request.send();
      var responseData = await res.stream.toBytes();

      var responseString = String.fromCharCodes(responseData);
      var resBody = jsonDecode(responseString);
      if (res.statusCode == 200) {
        await changeProfileIcon(resBody['filename']);
        return SuccessMessage(Message.Succes, resBody['filename']);
      }
      return SuccessMessage(Message.Error, "Error");
    } catch (error) {
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<SuccessMessage> changeProfileIcon(String profileIcon) async {
    await checkToken();
    String url = 'https://api.xpertmedia.uz/auth/v1/user/me';
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {"Authorization": "Bearer ${Global.myUserInfo.token}"},
        body: json.encode({
          "profile_icon": "https://cdn.xpertmedia.uz/$profileIcon",
        }),
      );
      if (response.statusCode == 200) {
        return SuccessMessage(Message.Succes, "");
      } else {
        var resBody = json.decode(response.body);
        return SuccessMessage(Message.Error, resBody['data']);
      }
    } catch (error) {
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<SuccessMessageUser> getProfileInfo() async {
    await checkToken();
    String url = 'https://api.xpertmedia.uz/auth/v1/user/me';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Authorization": "Bearer ${Global.myUserInfo.token}"},
      );
      var resBody = json.decode(response.body);
      if (response.statusCode == 200) {
        Global.myUserInfo = UserInfo.fromJson(
          resBody['data'],
          Global.myUserInfo.token,
          Global.myUserInfo.refresh_token,
        );
        return SuccessMessageUser(
          Message.Succes,
          "",
          UserInfo.fromJson(
            resBody['data'],
            Global.myUserInfo.token,
            Global.myUserInfo.refresh_token,
          ),
        );
      }
      return SuccessMessageUser(
          Message.Error,
          resBody['data'],
          UserInfo.fromJson(
            {},
            Global.myUserInfo.token,
            Global.myUserInfo.refresh_token,
          ));
    } catch (error) {
      return SuccessMessageUser(Message.Error, "Connection error", UserInfo.fromJson({}, "", ""));
    }
  }

  Future<SuccessMessage> changeProfile(String firstName, String lastName) async {
    await checkToken();
    String url = 'https://api.xpertmedia.uz/auth/v1/user/me';
    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {"Authorization": "Bearer ${Global.myUserInfo.token}"},
        body: json.encode({
          "first_name": firstName,
          "last_name": lastName,
        }),
      );
      if (response.statusCode == 200) {
        return SuccessMessage(Message.Succes, "");
      } else {
        var resBody = json.decode(response.body);
        return SuccessMessage(Message.Error, resBody['data']);
      }
    } catch (error) {
      return SuccessMessage(Message.Error, "Connection error");
    }
  }

  Future<void> checkToken() async {
    try{
      bool hasExpired = JwtDecoder.isExpired(Global.myUserInfo.token);
      if (hasExpired) {
        const url = 'https://api.xpertmedia.uz/auth/v1/refresh';
        try {
          final response = await http.post(
            Uri.parse(url),
            body: json.encode({"refresh_token": Global.myUserInfo.refresh_token}),
          );
          if (response.statusCode == 200) {
            var resBody = json.decode(response.body);
            await addUserSession(
              resBody['data']['user']['id'],
              resBody['data']['token']['access_token'],
              resBody['data']['token']['refresh_token'],
            );
            Global.myUserInfo = UserInfo.fromJson(
              resBody['data']['user'],
              resBody['data']['token']['access_token'],
              resBody['data']['token']['refresh_token'],
            );
          }
        } catch (error) {
          rethrow;
        }
      }
    }catch (e){}

  }

  Future<void> addUserSession(String id, String token, String refreshToken) async {
    InitDatabase initDatabase = InitDatabase();
    UserSessionTable userSessionTable = UserSessionTable();
    UserSession userSession = UserSession(
      user_id: id,
      token: token,
      refresh_token: refreshToken,
    );
    await initDatabase.initializedDB().whenComplete(() async {
      await userSessionTable.deleteUserSession();
      await userSessionTable.insertUserSession(userSession);
    });
  }
}
