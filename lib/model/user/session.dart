import 'dart:convert';


class Session {
  final String id;
  final String user_id;
  final String ip;
  final String expires_at;

  Session({
    required this.id,
    required this.user_id,
    required this.ip,
    required this.expires_at,
  });


  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id:  json['id'] ?? "",
    user_id: json['user_id'] ?? "",
    ip: json['ip'] ?? "",
    expires_at: json['expires_at'] ?? "",
  );

  static Map<String, dynamic> toMap(Session music) => {
    'id': music.id,
    'user_id': music.user_id,
    'ip': music.ip,
    'expires_at': music.expires_at,
  };

  static String encode(List<Session> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => Session.toMap(music))
        .toList(),
  );

  static List<Session> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Session>((item) => Session.fromJson(item))
          .toList();
}

class SessionList {
  final List<Session> session;

  SessionList({
    required this.session,
  });


  factory SessionList.fromJson(Map<String, dynamic> json) => SessionList(
    session:  json['sessions'].map<Session>((caseItem) => Session.fromJson(caseItem)).toList() ?? [],
  );
}
