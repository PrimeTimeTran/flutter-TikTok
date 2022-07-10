// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:worldlingo3/classes/ContentType.dart';

import 'package:worldlingo3/widgets/MediaContent.dart';

class TikTokPage extends StatefulWidget {
  const TikTokPage({Key? key}) : super(key: key);

  @override
  State<TikTokPage> createState() => _TikTokPageState();
}

class _TikTokPageState extends State<TikTokPage> {

  @override
  void initState() {
    super.initState();
  }

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: [
            for (var i = 0; i < mediaList.length; i++)
              MediaContent(index: i, id: mediaList[i].id),
          ],
        ),
        const Positioned.fill(
          top: 20,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text('PrimeTimeTran 123'),
          ),
        ),
      ],
    );
  }
}
