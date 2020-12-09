class Errors {
  static const String nullEmail = 'The email must have a value!';
  static const String invalidEmail =
      'Invalid email. It must be [@] [.] and longer than 5 characters';
  static const String invalidName = 'The name must have a value!';
  static const String invalidPassword =
      'Your password must be at least 6 digits';
  static const String signInFailed = 'Sorry! We cannot complete this operation';
  static const String signUpFailed = 'Sorry! We cannot complete this operation';
  static const String deleteMainProfile = 'You cannot delete the main profile!';
  static const String characterNotFound =
      '[NOT FOUND]. Please try to insert a Marvel character!';
  static const String emptyEmailAndPassword =
      'The Email and Password fields cannot be empty!';
  static const String passwordsNotEquals =
      'The Password and Password Confirmation must be the same!';
  static const String nullBirthday = 'The birthday must have a value!';
}
