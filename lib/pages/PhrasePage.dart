import 'package:flutter/material.dart';

import 'package:worldlingo3/model/phrase.dart';
import 'package:worldlingo3/api/sheets/phrase_sheets_api.dart';

class PhrasePage extends StatefulWidget {
  const PhrasePage({Key? key}) : super(key: key);

  @override
  State<PhrasePage> createState() => _PhrasePage();
}

class _PhrasePage extends State<PhrasePage> {
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
          padding: const EdgeInsets.all(10.0),
          itemCount: phrases.length,
          itemBuilder: (context, index) {
            var date = phrases[index].id.split(' ')[0].split('-');
            var humanReadable = '${date[1]}/${date[2]}/${date[0]}';
            return CustomListTile(
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.pink),
              ),
              title: phrases[index].en,
              subtitle: phrases[index].vi,
              // 'This text should max out at two lines and clip',
              author: phrases[index].author.isEmpty
                  ? 'Anonymous'
                  : phrases[index].author,
              publishDate: humanReadable,
              readDuration: '',
            );
          },
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '- $author',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  publishDate,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
