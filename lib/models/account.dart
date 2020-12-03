class Account {
  int id;
  String name;
  String email;
  String birthday;
  String encryptedPassword;

  Account(
    this.name,
    this.email,
    this.birthday,
    this.encryptedPassword,
  );

  Account.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    birthday = map['birthday'];
    encryptedPassword = map['encrypted_password'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'email': email,
      'birthday': birthday,
      'encrypted_password': encryptedPassword,
    };

    return map;
  }
}
