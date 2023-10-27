import 'package:sqflite/sqflite.dart';
import '../../core/database/init_database.dart';
import '../../model/user/user_session.dart';

class UserSessionTable {
  Future<int> insertUserSession(UserSession userSession) async {
    int result = 0;
    final Database db = await InitDatabase().initializedDB();
      result = await db.insert(
        'User_Session',
        userSession.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    return result;
  }

  Future<int> countUserSession() async {
    final Database db = await InitDatabase().initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('User_Session');
    return queryResult.map((e) => UserSession.fromMap(e)).length;
  }

  Future<UserSession> retrieveUserSession() async {
    final Database db = await InitDatabase().initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('User_Session');
    return queryResult.map((e) => UserSession.fromMap(e)).first;
  }

  Future<void> updateUserSession(String token,String refreshToken) async {
    final Database db = await InitDatabase().initializedDB();
    await db.rawUpdate(
      '''
    Update User_Session
       Set token = ?,
           refresh_token = ?
      ''',
      [token,refreshToken],
    );
  }

  Future<void> deleteUserSession() async {
    final Database db = await InitDatabase().initializedDB();
    await db.delete('User_Session');
  }
}
