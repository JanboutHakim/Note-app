import 'package:flutter/material.dart';
import 'package:noteapp/Functions.dart';
import 'package:noteapp/widgets/MyDialog.dart';

class WritingNote extends StatefulWidget {
  WritingNote({super.key, this.index});
  final int? index;

  @override
  State<WritingNote> createState() => _WritingNoteState();
}

class _WritingNoteState extends State<WritingNote> {
  final Color maincolor = Color.fromRGBO(34, 40, 49, 1);
  final Color secondrycolor = Color.fromRGBO(53, 62, 72, 1);
  TextEditingController _titlecontiner = TextEditingController();
  TextEditingController _textcontiner = TextEditingController();
  TextStyle setStyle(Color c, double size) {
    return TextStyle(
        fontFamily: 'Nunito',
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: c);
  }

  @override
  Widget build(BuildContext context) {
    widget.index == null
        ? null
        : _titlecontiner.text = Functions.notes[widget.index!];

    return Scaffold(
      backgroundColor: maincolor,
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: secondrycolor,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context, ["", ""]);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: secondrycolor,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: IconButton(
                onPressed: () {
                  print(_textcontiner.text);
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: secondrycolor,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: IconButton(
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MyDialog(
                          firstButtonfun: () {
                            Navigator.pop(context);
                          },
                          secondButtonfun: () {
                            Navigator.pop(context);
                          },
                          title: 'Save Changes?',
                          secondButton: 'Save',
                          firstButton: 'Discard',
                        );
                      });
                  Navigator.pop(
                      context, [_titlecontiner.text, _textcontiner.text]);
                },
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Expanded(
            child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            TextField(
              maxLines: 1,
              controller: _titlecontiner,
              style: setStyle(Colors.white, 43.0),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: setStyle(Colors.white, 43)),
            ),
            TextField(
              maxLines: 60,
              controller: _textcontiner,
              style: setStyle(Colors.white, 23.0),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'type somthing here',
                  hintStyle: setStyle(Colors.white, 23.0)),
            )
          ],
        ))
      ]),
    );
  }
}
