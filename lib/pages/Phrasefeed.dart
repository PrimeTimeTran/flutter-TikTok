// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:worldlingo3/model/phrase.dart';
import 'package:worldlingo3/api/sheets/phrase_sheets_api.dart';

class Phrasefeed extends StatefulWidget {
  const Phrasefeed({Key? key}) : super(key: key);

  @override
  State<Phrasefeed> createState() => _Phrasefeed();
}

class _Phrasefeed extends State<Phrasefeed> {
  List<Phrase> phrases = [];

  @override
  void initState() {
    super.initState();

    getPhrases();
  }

  Future getPhrases() async {
    final phrases = await PhraseSheetsApi.getAll();
    setState(() {
      this.phrases = phrases;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: phrases.length,
          itemBuilder: (context, index) {
            final icon = Icon(Icons.email, color: Colors.red, size: 30);
            return ListTile(
              title: Text(phrases[index].vi),
              subtitle: Text(phrases[index].en),
              leading: icon,
            );
          },
        ),
      ),
    );
  }
}
