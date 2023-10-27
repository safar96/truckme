import '../../model/user/user_info.dart';

class Global {
  static String deviceId = "";

  static bool isFirst = true;

  static UserInfo myUserInfo = UserInfo(
    id: "",
    active: 0,
    email: "",
    first_name: "",
    last_name: "",
    password: "",
    profile_icon: "",
    phone_number: "",
    subscription_expiration_date: "",
    user_type: "",
    balance: 0,
    isPaidUser: false,
    token: "",
    refresh_token: "",
  );
}
