import 'package:flutter_test2/models/model_note.dart';

class AppDatabase {
  List<Note> _mockNotes = [
    Note(id: '1', title: 'Купить аксесуары', description: 'чехол, наушники, MagSafe', createdAt: DateTime.now()),
    Note(id: '2', title: 'Качалка', description: 'Пойти в качалку', createdAt: DateTime.now()),
  ];

  List<Note> get allNotes => _mockNotes;

  void add(Note note) => _mockNotes.add(note);
  
  void delete(String id) => _mockNotes.removeWhere((n) => n.id == id);

  void update(Note updatedNote) {
    int index = _mockNotes.indexWhere((n) => n.id == updatedNote.id);
    if (index != -1) _mockNotes[index] = updatedNote;
  }
}