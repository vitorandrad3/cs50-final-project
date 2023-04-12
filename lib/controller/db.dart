import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../domain/transaction_model.dart';

class TransactionDatabase {
  static final TransactionDatabase instance = TransactionDatabase.init();
  static Database? _database;

  TransactionDatabase.init();

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB('transactions.db');
    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transactions(
        id TEXT PRIMARY KEY,
        description TEXT,
        value REAL,
        date TEXT
      )
    ''');
  }

  Future<void> addTransaction(MyTransaction transaction) async {
    final db = await instance.database;
    await db.insert('transactions', transaction.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<MyTransaction>> getTransactions() async {
    final db = await instance.database;
    final transactions = await db.query('transactions');
    return transactions.map((json) => MyTransaction.fromMap(json)).toList();
  }

  Future<void> removeTransaction(String id) async {
    final db = await instance.database;
    await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }
}
