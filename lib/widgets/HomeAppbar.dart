import 'package:flutter/material.dart';
import 'package:noteapp/Functions.dart';

class HomeAppbar extends StatefulWidget {
  HomeAppbar({super.key, required this.search});
  Function search;

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  Color maincolor = Color.fromRGBO(34, 40, 49, 1);
  Color secondrycolor = Color.fromRGBO(53, 62, 72, 1);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 20,
        ),
        const Text(
          'Note',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 43,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        const SizedBox(
          width: 100,
        ),
        Row(children: [
          Container(
            decoration: BoxDecoration(
                color: secondrycolor,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: IconButton(
              onPressed: () {
                widget.search();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: secondrycolor,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext) {
                      return Dialog(
                        backgroundColor: Functions.secondrycolor,
                        child: Container(
                            height: 150,
                            child: Center(
                              child: Text(
                                'Creator:Janbout Hakim',
                                style: Functions.setStyle(Colors.white, 20),
                              ),
                            )),
                      );
                    });
              },
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
            ),
          ),
        ])
      ],
    );
  }
}
