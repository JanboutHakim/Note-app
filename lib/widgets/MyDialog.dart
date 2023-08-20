import 'package:flutter/material.dart';
import 'package:noteapp/Functions.dart';

class MyDialog extends StatefulWidget {
  final String title;
  final String firstButton;
  final String secondButton;

  Function secondButtonfun;
  Function firstButtonfun;

  MyDialog(
      {super.key,
      required this.firstButtonfun,
      required this.secondButtonfun,
      required this.title,
      required this.firstButton,
      required this.secondButton});

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        height: 250,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 5 / 100),
        decoration: BoxDecoration(
            border: Border.all(
              width: 0,
            ),
            color: Functions.secondrycolor,
            borderRadius: const BorderRadius.all(Radius.circular(0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.info,
              size: 43,
              color: Colors.white,
            ),
            Text(widget.title, style: Functions.setStyle(Colors.white, 36)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      widget.firstButtonfun();
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: Text(
                      style: Functions.setStyle(Colors.white, 20),
                      widget.firstButton,
                    )),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                      Colors.green[600],
                    )),
                    onPressed: () {
                      widget.secondButtonfun();
                    },
                    child: Text(
                      widget.secondButton,
                      style: Functions.setStyle(Colors.white, 20),
                    )),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
