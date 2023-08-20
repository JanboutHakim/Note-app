import 'package:flutter/material.dart';

class Cancelbutton extends StatefulWidget {
  const Cancelbutton({super.key});

  @override
  State<Cancelbutton> createState() => _CancelbuttonState();
}

class _CancelbuttonState extends State<Cancelbutton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
  }
}
