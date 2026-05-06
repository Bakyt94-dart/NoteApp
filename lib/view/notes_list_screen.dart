import 'package:flutter/material.dart';
import 'package:flutter_test2/view/view_model.dart';
import 'package:provider/provider.dart';
import 'note_edit_screen.dart';

class NotesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Заметки', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: viewModel.notes.isEmpty
          ? Center(child: Text('Заметок пока нет'))
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: viewModel.notes.length,
              itemBuilder: (context, index) {
                final note = viewModel.notes[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(note.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(note.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NoteEditScreen(note: note)),
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => viewModel.deleteNote(note.id),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteEditScreen()),
          );
        },
      ),
    );
  }
}