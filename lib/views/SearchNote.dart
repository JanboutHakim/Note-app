import 'package:flutter/material.dart';
import 'package:noteapp/Functions.dart';
import 'package:noteapp/views/notecard.dart';

class SearchNote extends StatefulWidget {
  const SearchNote({super.key});

  @override
  State<SearchNote> createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {
  List<String> resualt = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Functions.maincolor,
      body: Container(
        child: Column(children: [
          SafeArea(
            top: true,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 100,
            ),
          ),
          Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 5 / 100,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 40,
                color: Colors.white,
              ),
            ),
          ]),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: TextField(
              onChanged: (search) {
                setState(() {
                  resualt = Functions.Search(search);
                });
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Search By The Keyword...',
                  hintStyle: Functions.setStyle(Colors.white, 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: Functions.secondrycolor),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: resualt.length,
                itemBuilder: (Context, index) {
                  return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (DismissDirection direction) {
                        setState(() {});
                      },
                      background: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red[600],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: const Icon(
                          Icons.delete,
                          size: 43,
                          color: Colors.white,
                        ),
                      ),
                      child: NoteCard(
                        title: '',
                        text: resualt[index],
                        height: MediaQuery.of(context).size.height * 14.2 / 100,
                      ));
                }),
          )
        ]),
      ),
    );
  }
}
