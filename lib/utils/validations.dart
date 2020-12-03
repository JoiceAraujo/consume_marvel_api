import '../models/account.dart';
import '../utils/errors.dart';

class Validations {
  bool emailIsValid(String email) {
    if (email.contains('@') && email.contains('.')) {
      return true;
    } else {
      return false;
    }
  }

  Account signInFailed() {
    Account account;
    print(Errors.signInFailed);
    return account;
  }

  Account signUpFailed() {
    Account account;
    print(Errors.signInFailed);
    return account;
  }
}