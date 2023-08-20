import 'package:flutter/material.dart';

import 'package:noteapp/Functions.dart';
import 'package:noteapp/views/WritingNote.dart';

class NoteCard extends StatefulWidget {
  final String text;
  final double height;
  final String title;

  NoteCard(
      {super.key,
      required this.text,
      required this.height,
      required this.title});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  Color randomcolor = Functions.getRandomColor();
  TextStyle setStyle(Color c, double size) {
    return TextStyle(
        fontFamily: 'Nunito',
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: c);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: randomcolor),
        child: ListTile(
          iconColor: Colors.black,
          leading: const Icon(
            Icons.note,
            color: Colors.white,
            size: 56,
          ),
          title: Text(
            widget.title,
            style: setStyle(Colors.white, 36),
          ),
          subtitle: Text(
            widget.text,
            style: setStyle(Colors.grey, 26),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WritingNote()));
          },
        ),
      ),
    );
  }
}
