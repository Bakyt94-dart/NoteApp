import 'package:flutter_test2/models/model_note.dart';
import 'app_database.dart';

abstract class NoteRepository {
  List<Note> getNotes();
  void addNote(Note note);
  void deleteNote(String id);
  void updateNote(Note note);
}

class NoteRepositoryImpl implements NoteRepository {
  final AppDatabase _db;
  NoteRepositoryImpl(this._db);

  @override
  List<Note> getNotes() => _db.allNotes;

  @override
  void addNote(Note note) => _db.add(note);

  @override
  void deleteNote(String id) => _db.delete(id);

  @override
  void updateNote(Note note) => _db.update(note);
}
