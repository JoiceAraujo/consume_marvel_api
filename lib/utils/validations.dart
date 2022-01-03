import '../models/account.dart';
import '../utils/errors.dart';

class Validations {
  bool credentialsIsNotEmpty(String email, String password) {
    return email.trim().isNotEmpty && password.trim().isNotEmpty == true
        ? true
        : false;
  }

  bool emailIsValid(String email) {
    return email.contains('@') && email.contains('.') && email.length >= 5
        ? true
        : false;
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

  String nameIsValid(String name) {
    if (name.trim().isEmpty) {
      return Errors.invalidName;
    } else {
      return null;
    }
  }

  String birthdayIsValid(String birthday) {
    if (birthday.trim().isEmpty) {
      return Errors.nullBirthday;
    } else {
      return null;
    }
  }

  String emailValidation(String email) {
    if (email.trim().isEmpty) {
      return Errors.nullEmail;
    } else {
      if (emailIsValid(email) == false) {
        return Errors.invalidEmail;
      } else {
        return null;
      }
    }
  }

  String passwordValidation(String password) {
    return password.length < 6 ? Errors.invalidPassword : null;
  }

  String passwordConfirmationValidation(
    String password,
    String passwordConfirmation,
  ) {
    if (password != passwordConfirmation) {
      return Errors.passwordsNotEquals;
    }
    return null;
  }
}
