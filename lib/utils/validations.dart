import '../models/account.dart';
import '../utils/errors.dart';

class Validations {
  bool credentialsIsNotEmpty(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty == true ? true : false;
  }

  bool emailIsValid(String email) {
    return email.contains('@') && email.contains('.') ? true : false;
  }

  bool passwordIsValid(String password) {
    return password.length >= 6 ? true : false;
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

  bool nameIsValid(String name) {
    if (name.isNotEmpty) {
      return true;
    } else {
      print(Errors.invalidName);
      return false;
    }
  }
}
