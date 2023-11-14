import 'package:ebank/src/core/data/models/index.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  static final LocalDataSource _instance = LocalDataSource._();

  factory LocalDataSource() => _instance;

  static Database? _db;
  final String tableUser = 'users';
  final String tableWalletAccount = 'walletAccounts';

  Future<Database> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  LocalDataSource._();

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ewallet.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY,
          username TEXT NOT NULL,
          email TEXT NOT NULL,
          password TEXT NOT NULL,
          phoneNumber TEXT NOT NULL,
          firstName TEXT NOT NULL,
          lastName TEXT NOT NULL,
          isAuthenticated INTEGER NOT NULL
      );
    ''');
    await db.execute('''
        INSERT OR IGNORE INTO users (
            username, email, password, phoneNumber, firstName, lastName, isAuthenticated
        ) VALUES (
            'admin', 'admin@example.com', 'P@55word', '+254712345678', 'John', 'Doe', 0
        );
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS walletAccounts (
          id INTEGER PRIMARY KEY,
          accountNumber TEXT NOT NULL,
          amount INTEGER NOT NULL,
          type TEXT NOT NULL
      );
    ''');
    await db.execute('''
        INSERT OR IGNORE INTO walletAccounts (
            accountNumber, amount, type
        ) VALUES (
            '0112345678', 1000, 'current'
        ), (
            '0222345678', 2200, 'fixedDeposit'
        ), (
            '0332345678', 10000, 'nominated'
        ), (
            '0442345678', 40000, 'personal'
        ), (
            '0552345678', 60000, 'savings'
        );
    ''');
  }

  /*
  * Users
  * */
  Future<int> addUser(User user) async {
    final database = await db;
    return await database.transaction((txn) async {
      return await txn.insert(tableUser, user.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<User>> getAllUsers() async {
    final database = await db;
    final List<Map<String, dynamic>> maps = await database.query(
      tableUser,
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
      (index) {
        return User.fromJson(maps[index]);
      },
    );
  }

  Future<User?> signInUser(String username, String password) async {
    final database = await db;
    List<Map<String, dynamic>> queryResult = await database.query(
      tableUser,
      where: "username = ? and password = ?",
      whereArgs: [username, password],
    );
    User? user =
        queryResult.isNotEmpty ? User.fromJson(queryResult.first) : null;
    if (user != null) {
      user = user.copyWith(isAuthenticated: true);
      updateUser(user);
      return user;
    }
    return null;
  }

  Future<User?> getCurrentUser() async {
    final database = await db;
    List<Map<String, dynamic>> users = await database
        .query(tableUser, where: 'isAuthenticated = ?', whereArgs: [1]);
    return users.isNotEmpty ? User.fromJson(users.first) : null;
  }

  Future<int> updateUser(User user) async {
    final database = await db;
    return database.transaction((txn) async {
      return await txn.update(
        tableUser,
        user.toJson(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
    });
  }

  Future<int> deleteUser(User user) async {
    final database = await db;
    return database.transaction(
      (txn) async {
        return await txn.delete(
          tableUser,
          where: 'id = ?',
          whereArgs: [user.id],
        );
      },
    );
  }

/*
  * Wallets
  * */
  Future<int> addWallet(WalletAccount wallet) async {
    final database = await db;
    return await database.transaction((txn) async {
      return await txn.insert(tableWalletAccount, wallet.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<WalletAccount>> getAllWallets() async {
    final database = await db;
    final List<Map<String, dynamic>> maps = await database.query(
      tableWalletAccount,
      orderBy: "id DESC",
      limit: 5,
    );
    return List.generate(
      maps.length,
      (index) {
        return WalletAccount.fromJson(maps[index]);
      },
    );
  }

  Future<int> updateWallet(WalletAccount wallet) async {
    final database = await db;
    return database.transaction((txn) async {
      return await txn.update(
        tableWalletAccount,
        wallet.toJson(),
        where: 'id = ?',
        whereArgs: [wallet.id],
      );
    });
  }

  Future<int> deleteWallet(WalletAccount wallet) async {
    final database = await db;
    return database.transaction(
      (txn) async {
        return await txn.delete(
          tableWalletAccount,
          where: 'id = ?',
          whereArgs: [wallet.id],
        );
      },
    );
  }
}
