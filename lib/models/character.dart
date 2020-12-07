class Character {
  int id;
  String name;
  String description;
  String thumbnailPath;
  String thumbnailExtension;

  Character(this.id, this.name, this.description, this.thumbnailPath,
      this.thumbnailExtension);

  Character.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    thumbnailPath = map['thumbnail']['path'];
    thumbnailExtension = map['thumbnail']['extension'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnailPath,
      'extension': thumbnailExtension,
    };

    return map;
  }
}
