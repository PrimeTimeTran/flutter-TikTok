import 'package:flutter/material.dart';
import 'dart:math';

import 'package:worldlingo3/classes/ContentType.dart';

import 'package:worldlingo3/widgets/MediaContentPreview.dart';
import 'package:worldlingo3/widgets/MediaContent.dart';
import 'package:worldlingo3/widgets/Carousel.dart';

final _random = Random();

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPage();
}

class _DiscoverPage extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final List<String> entries = <String>[
      'Alpha',
      'Bravo',
      'Charlie',
      'Echo',
      'Delta',
    ];

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Carousel(),
          ListView.separated(
            itemCount: entries.length,
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: width * .33,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    final el = mediaList[_random.nextInt(mediaList.length)];
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: IgnorePointer(
                        child: MediaContentPreview(id: el.id),
                      ),
                      onTap: () {
                        debugPrint('onTap ${el.id}: ${el.mediaUrl}');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((ctx) =>
                                MediaContent(id: el.id, discover: true)),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text('Alpha'),
                      Text('Alpha'),
                    ],
                  ),
                  Column(
                    children: const [Text('Bravo')],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
