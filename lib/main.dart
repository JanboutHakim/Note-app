import 'package:flutter/material.dart';
import 'package:noteapp/views/HomeScreen.dart';
import 'package:noteapp/views/SearchNote.dart';
import 'package:noteapp/views/WritingNote.dart';

void main() {
  runApp(
    MaterialApp(theme: ThemeData.dark(), routes: {
      '/': (context) => HomeScreen(),
      '/Note': (context) => WritingNote(),
      '/Search': (context) => SearchNote()
    }),
  );
}
