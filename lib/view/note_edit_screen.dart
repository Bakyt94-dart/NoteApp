import 'package:flutter/material.dart';
import 'package:flutter_test2/models/model_note.dart';
import 'package:flutter_test2/view/view_model.dart';
import 'package:provider/provider.dart';

class NoteEditScreen extends StatefulWidget {
  final Note? note; 

  NoteEditScreen({this.note});

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _descController = TextEditingController(text: widget.note?.description ?? '');
  }

  void _save(BuildContext context) {
    final viewModel = context.read<NotesViewModel>();
    if (_titleController.text.isEmpty) return;

    if (widget.note == null) {
      viewModel.addNote(_titleController.text, _descController.text);
    } else {
      final updatedNote = widget.note!.copyWith(
        title: _titleController.text,
        description: _descController.text,
      );
      viewModel.updateNote(updatedNote);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Новая заметка' : 'Редактировать'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => _save(context),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Заголовок', border: InputBorder.none),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Expanded(
              child: TextField(
                controller: _descController,
                decoration: InputDecoration(hintText: 'Начните писать...', border: InputBorder.none),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}