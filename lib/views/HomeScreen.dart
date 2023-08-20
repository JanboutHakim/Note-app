import 'package:flutter/material.dart';
import 'package:noteapp/views/notecard.dart';
import 'package:noteapp/widgets/HomeAppbar.dart';
import 'package:noteapp/Functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<String> notes = [];
  @override
  Widget build(BuildContext context) {
    notes = Functions.notes;
    void updatenotes(final Resualt) {
      setState(() {
        if (Resualt[1] != '') Functions.notesthings.add(Resualt[1]);

        if (Resualt[0] != '') Functions.notes.add(Resualt[0]);
      });
    }

    return Scaffold(
        backgroundColor: Functions.maincolor,
        body: SafeArea(
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 14.2 / 100,
                child: HomeAppbar(
                  search: () {
                    Navigator.pushNamed(context, '/Search');
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                FloatingActionButton(
                  onPressed: () async {
                    final Resualt = await Navigator.pushNamed(context, '/Note');
                    updatenotes(Resualt);
                  },
                  backgroundColor: Functions.secondrycolor,
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 5 / 100,
                )
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 3 / 100,
              )
            ],
          ),
        ));
  }
}
