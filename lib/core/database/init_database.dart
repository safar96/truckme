import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class InitDatabase {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'truckme.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE User_Session(user_id TEXT NOT NULL, token TEXT NOT NULL, refresh_token TEXT NOT NULL)",
        );
      },
    );
  }
}
