import 'package:shared_preferences/shared_preferences.dart';

import '../database/database_provider.dart';
import '../models/account.dart';
import '../utils/validations.dart';

class AccountService {
  final DatabaseProvider database = DatabaseProvider.db;
  SharedPreferences _prefs;
  Validations validation = Validations();

  Future<Account> accountLogged() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs.get('email') != null) {
      String email = _prefs.getString('email');
      String encryptedPassword = _prefs.getString('encryptedPassword');
      return database.signIn(email, encryptedPassword);
    } else {
      return null;
    }
  }

  Future<Account> signIn(email, encryptedPassword) async {
    _prefs = await SharedPreferences.getInstance();
    Account account = await database.signIn(email, encryptedPassword);
    if (account != null) {
      _prefs.setString('email', account.email);
      _prefs.setString('encryptedPassword', account.encryptedPassword);
      return account;
    } else {
      return null;
    }
  }

  Future<Account> signUp(Account account) async {
    Account accountService = await database.signUp(account);
    if (accountService != null) {
      return await signIn(
          accountService.email, accountService.encryptedPassword);
    } else {
      return null;
    }
  }

  void signOut() {
    _prefs.clear();
  }
}
