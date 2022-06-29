class Note{
  int id;
  String title;
  String description;

  Note({required this.id,required this.title,required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  Note.fromMap(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        description = json["description"];

  @override
  String toString() {
    return 'note{id: $id, title: $title, description: $description}';
  }
}