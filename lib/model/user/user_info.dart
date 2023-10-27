
class UserInfo {
  final String id;
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final int active;
  final String user_type;
  final String profile_icon;
  final String phone_number;
  final String subscription_expiration_date;
  final int balance;
  final bool isPaidUser;
  final String token;
  final String refresh_token;

  UserInfo({
    required this.id,
    required this.active,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.password,
    required this.phone_number,
    required this.profile_icon,
    required this.subscription_expiration_date,
    required this.user_type,
    required this.balance,
    required this.isPaidUser,
    required this.token,
    required this.refresh_token,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json, String token, String refresh_token) {
    String subscription = json['subscription_expiration_date'] ?? "";
    // String subscription =  "";
    bool isPaid = false;
    if (subscription != "") {
      DateTime sub = DateTime.parse(json['subscription_expiration_date'] ?? "");
      if (DateTime.now().isBefore(sub)) {
        isPaid = true;
      }
    }

    return UserInfo(
        id: json['id'] ?? "",
        active: json['active'] ?? 0,
        email: json['email'] ?? "",
        first_name: json['first_name'] ?? "",
        last_name: json['last_name'] ?? "",
        password: json['password'] ?? "",
        profile_icon: json['profile_icon'] ?? "",
        phone_number: json['phone_number'] ?? "",
        subscription_expiration_date: json['subscription_expiration_date'] ?? "",
        user_type: json['user_type'] ?? "",
        balance: json['balance'] ?? 0,
        isPaidUser: isPaid,
        token: token,
        refresh_token: refresh_token);
  }
}
