import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "app_database.db";
  static final _databaseVersion = 1;

  static final tableCategories = 'categories';
  static final tableProducts = 'products';
  static final tableBanners = 'banners';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableCategories (
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableProducts (
        id INTEGER PRIMARY KEY,
        name TEXT,
        price REAL,
        category TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableBanners (
        id INTEGER PRIMARY KEY,
        type TEXT,
        title TEXT,
        contents TEXT
      )
    ''');
  }

  Future<void> insertCategory(Map<String, dynamic> row) async {
    Database db = await database;
    await db.insert(tableCategories, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertProduct(Map<String, dynamic> row) async {
    Database db = await database;
    await db.insert(tableProducts, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertBanner(Map<String, dynamic> row) async {
    Database db = await database;
    await db.insert(tableBanners, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAllCategories() async {
    Database db = await database;
    return await db.query(tableCategories);
  }

  Future<List<Map<String, dynamic>>> queryAllProducts() async {
    Database db = await database;
    return await db.query(tableProducts);
  }

  Future<List<Map<String, dynamic>>> queryAllBanners() async {
    Database db = await database;
    return await db.query(tableBanners);
  }
}
