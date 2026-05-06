import 'package:flutter/material.dart';
import 'package:flutter_test2/view/notes_list_screen.dart';
import 'package:flutter_test2/view/view_model.dart';
import 'package:provider/provider.dart';
import 'data/app_database.dart';
import 'data/note_repository.dart';


void main() {
  final db = AppDatabase();
  final repository = NoteRepositoryImpl(db);

  runApp(
    ChangeNotifierProvider(
      create: (context) => NotesViewModel(repository: repository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Заметки',
      
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      
      home: NotesListScreen(),
    );
  }
}