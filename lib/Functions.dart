import 'package:flutter/material.dart';
import 'dart:math';

abstract class Functions {
  static Color maincolor = Color.fromRGBO(34, 40, 49, 1);
  static Color secondrycolor = Color.fromRGBO(53, 62, 72, 1);
  static List<String> notes = [];
  static List<String> notesthings=[];


  static List<String> Search(String tit) {
    List<String> resualtnotes = [];

    int i = 0;
    for (; i < notes.length; i++) {
      if (notes[i].contains(tit)) if (tit != '') if (!resualtnotes
          .contains(notes[i])) resualtnotes.add(notes[i]);
    }
    return resualtnotes;
  }

  static TextStyle setStyle(Color c, double size) {
    return TextStyle(
        fontFamily: 'Nunito',
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: c);
  }
 static Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
