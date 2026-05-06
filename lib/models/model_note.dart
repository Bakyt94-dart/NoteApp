class Note {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  Note copyWith({String? title, String? description}) {
    return Note(
      id: this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: this.createdAt,
    );
  }
}