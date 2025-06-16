import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'inventory.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE items (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          quantity INTEGER
        )
      ''');
    });
  }

  static Future<int> insertItem(String name, int quantity) async {
    final dbClient = await db;
    return await dbClient.insert('items', {'name': name, 'quantity': quantity});
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final dbClient = await db;
    return await dbClient.query('items');
  }
  
  static Future<int> updateItem(int id, String name, int quantity) async {
  final dbClient = await db;
  return await dbClient.update(
    'items',
    {'name': name, 'quantity': quantity},
    where: 'id = ?',
    whereArgs: [id],
  );
}

static Future<int> deleteItem(int id) async {
  final dbClient = await db;
  return await dbClient.delete(
    'items',
    where: 'id = ?',
    whereArgs: [id],
  );
}
}
