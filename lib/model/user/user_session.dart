class UserSession {
  final String user_id;
  final String token;
  final String refresh_token;

  UserSession({
    required this.user_id,
    required this.token,
    required this.refresh_token,
  });

  UserSession.fromMap(Map<String, dynamic> result)
      : user_id = result["user_id"],
        token = result["token"],
        refresh_token = result["refresh_token"];

  Map<String, Object> toMap() {
    return {
      'user_id': user_id,
      'token': token,
      'refresh_token': refresh_token,
    };
  }
}
