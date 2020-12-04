import 'package:shared_preferences/shared_preferences.dart';

import '../database/database_provider.dart';
import '../models/account.dart';
import '../utils/errors.dart';
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
      return validation.signInFailed();
    }
  }

  Future<bool> signUp(Account account) async {
    if (validation.emailIsValid(account.email)) {
      Account accountService = await database.signUp(account);
      signIn(accountService.email, accountService.encryptedPassword);
      return true;
    } else {
      print(Errors.invalidEmail);
      return false;
    }
  }

  void signOut() {
    _prefs.clear();
  }
}
