class Profile {
  int id;
  bool main;
  String name;
  int accountId;

  Profile(this.name, this.accountId, this.main);

  Profile.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    accountId = map['account_id'];
    main = map['main'] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'account_id': accountId,
      'main': main == true ? 1 : 0,
    };

    return map;
  }
}
