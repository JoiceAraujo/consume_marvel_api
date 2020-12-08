import 'package:flutter/widgets.dart';

import '../models/account.dart';
import '../services/account_service.dart';

class AccountController extends ChangeNotifier {
  AccountService accountService = AccountService();
  AccountState accountState = AccountState.undefined;
  Account account;

  void init() async {
    accountState = AccountState.authenticating;
    notifyListeners();

    account = await accountService.accountLogged();

    if (account != null) {
      accountState = AccountState.authenticated;
    } else {
      accountState = AccountState.unauthenticated;
    }
    notifyListeners();
  }

  void signIn(email, encryptedPassword) async {
    accountState = AccountState.authenticating;
    notifyListeners();

    account = await accountService.signIn(email, encryptedPassword);
    if (account != null) {
      accountState = AccountState.authenticated;
    } else {
      accountState = AccountState.error;
    }
    notifyListeners();
  }

  void signUp(Account newAccount) async {
    accountState = AccountState.authenticating;
    notifyListeners();

    account = await accountService.signUp(newAccount);
    if (account != null) {
      accountState = AccountState.authenticated;
    } else {
      accountState = AccountState.unauthenticated;
    }
    notifyListeners();
  }

  void signOut() {
    accountState = AccountState.authenticated;
    notifyListeners();

    accountService.signOut();

    accountState = AccountState.unauthenticated;
    notifyListeners();
  }
}

enum AccountState {
  undefined,
  unauthenticated,
  authenticated,
  authenticating,
  error,
}
