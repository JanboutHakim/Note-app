import 'package:flutter/material.dart';

class Countinuebutton extends StatefulWidget {
  const Countinuebutton({super.key});

  @override
  State<Countinuebutton> createState() => _CountinuebuttonState();
}

class _CountinuebuttonState extends State<Countinuebutton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("Continue"),
      onPressed: () {},
    );
  }
}
