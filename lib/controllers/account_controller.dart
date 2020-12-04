import 'package:flutter/widgets.dart';

import '../models/account.dart';
import '../services/account_service.dart';

class AccountController extends ChangeNotifier {
  AccountService accountService;
  AccountState state = AccountState.undefined;
  Account account;

  void init() async {
    state = AccountState.authenticating;
    notifyListeners();

    account = await accountService.accountLogged();

    if (account != null) {
      state = AccountState.authenticated;
    } else {
      state = AccountState.unauthenticated;
    }
    notifyListeners();
  }

  void signIn(email, encryptedPassword) async {
    state = AccountState.authenticating;
    notifyListeners();

    account = await accountService.signIn(email, encryptedPassword);
    if (account != null) {
      state = AccountState.authenticated;
    } else {
      state = AccountState.unauthenticated;
    }
    notifyListeners();
  }

  void signUp(Account newAccount) async {
    state = AccountState.authenticating;
    notifyListeners();

    if (await accountService.signUp(account)) {
      state = AccountState.authenticated;
    } else {
      state = AccountState.unauthenticated;
    }
    notifyListeners();
  }

  void signOut() {
    state = AccountState.authenticated;
    notifyListeners();

    accountService.signOut();

    state = AccountState.unauthenticated;
    notifyListeners();
  }
}

enum AccountState {
  undefined,
  unauthenticated,
  authenticated,
  authenticating,
}
