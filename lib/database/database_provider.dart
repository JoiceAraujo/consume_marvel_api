import 'package:consume_marvel_api/models/account.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_queries.dart';

class DatabaseProvider {
  static final DatabaseProvider db = DatabaseProvider._();
  static Database _database;

  const DatabaseProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _init();
      return _database;
    }
  }

  Future<Database> _init() async {
    final String documentsDirectory = await getDatabasesPath();
    final String path = join(documentsDirectory, 'ConsumeMarvelApi.db');
    final Function onCreateFunction = (Database db, int version) async {
      for (String query in DatabaseQueries.queries) {
        await db.execute(query);
      }
    };

    return await openDatabase(path, version: 1, onCreate: onCreateFunction);
  }

//  Accounts methods

  Future<Account> signIn(email, encryptedPassword) async {
    Account account;
    final Database db = await database;

    try {
      final List<Map<String, dynamic>> queryResult = await db.query(
        'Accounts',
        where: 'email = ? AND encrypted_password =?',
        whereArgs: [email, encryptedPassword],
      );

      if (queryResult.isNotEmpty) {
        return Account.fromMap(queryResult.first);
      } else {
        return account;
      }
    } catch (e) {
      print(e);
      return account;
    }
  }

  Future<Account> signUp(Account account) async {
    final Database db = await database;

    account.id = await db.insert('Accounts', account.toMap());

    return account;
  }

//  Profiles methods

}
