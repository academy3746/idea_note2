import 'package:idea_note2/data/db_config.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database database;

  /// Initialize Database
  Future<void> initDatabase() async {
    /// Get Database Path
    String path = join(await getDatabasesPath(), "idea.db");

    /// Open Database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
      /// Create idea table if not exists
      db.execute("""
        CREATE TABLE IF NOT EXISTS tb_idea(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          motive TEXT,
          content TEXT,
          importance INTEGER,
          feedback TEXT,
          datetime INTEGER
        )
      """);
    });
  }

  /// IdeaInfo CREATE (INSERT)
  Future<int> insertIdeaInfo(IdeaInfo ideaInfo) async {
    return await database.insert("tb_idea", ideaInfo.toMap());
  }

  /// IdeaInfo READ (SELECT)
  Future<List<IdeaInfo>> getAllIdeaInfo() async {
    final List<Map<String, dynamic>> result = await database.query("tb_idea");

    return List.generate(result.length, (index) {
      return IdeaInfo.formMap(result[index]);
    });
  }

  /// IdeaInfo UPDATE
  Future<int> updateIdeaInfo(IdeaInfo ideaInfo) async {
    return await database.update(
      "tb_idea",
      ideaInfo.toMap(),
      where: "id = ?",
      whereArgs: [ideaInfo.id],
    );
  }

  /// IdeaInfo DELETE
  Future<int> deleteIdeaInfo(int id) async {
    return await database.delete(
      "tb_idea",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /// Exit IdeaInfo
  Future<void> exitIdeaInfo() async {
    await database.close();
  }
}
