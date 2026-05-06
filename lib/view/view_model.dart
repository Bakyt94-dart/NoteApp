import 'package:flutter/material.dart';
import 'package:flutter_test2/models/model_note.dart';
import '../data/note_repository.dart';

class NotesViewModel extends ChangeNotifier {
  final NoteRepository repository;
  List<Note> _notes = [];

  NotesViewModel({required this.repository}) {
    fetchNotes();
  }

  List<Note> get notes => _notes;

  void fetchNotes() {
    _notes = List.from(repository.getNotes());
    notifyListeners();
  }

  void addNote(String title, String desc) {
    final newNote = Note(
      id: DateTime.now().toString(),
      title: title,
      description: desc,
      createdAt: DateTime.now(),
    );
    repository.addNote(newNote);
    fetchNotes();
  }

  void deleteNote(String id) {
    repository.deleteNote(id);
    fetchNotes();
  }

  void updateNote(Note note) {
    repository.updateNote(note);
    fetchNotes();
  }
}


class CounterViewModel extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); 
  }
}