import 'package:flutter/material.dart';

import 'package:worldlingo3/classes/ContentType.dart';

class TikTokPage extends StatefulWidget {
  const TikTokPage({Key? key}) : super(key: key);

  @override
  State<TikTokPage> createState() => _TikTokPageState();
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 40,
      color: Colors.white,
    );
  }
}

class _TikTokPageState extends State<TikTokPage> {
  late List _contentTypeList = <ContentType>[];

  @override
  void initState() {
    super.initState();
    _contentTypeList = ContentType().createSampleList();
  }

  PageController controller = PageController(initialPage: 0);

  contentBuilder(i, color) {
    print(_contentTypeList);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: color,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(bottom: 30, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _contentTypeList[i].creatorName,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    ),
                    Text(
                      _contentTypeList[i].caption,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          decoration: TextDecoration.none),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.my_library_music),
                        Text(
                          _contentTypeList[i].soundTitle,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              decoration: TextDecoration.none),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                height: height / 1.8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.person_pin_circle_sharp),
                      Column(
                        children: [
                          const Icon(Icons.heart_broken),
                          Text(
                            _contentTypeList[i].countLikes.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.message),
                          Text(
                            _contentTypeList[i].countComments.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.bookmark_outlined),
                          Text(
                            _contentTypeList[i].countBookmarks.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.share_sharp),
                          Text(
                            _contentTypeList[i].countShares.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.music_video),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gr = ContentType().createSampleList();
    print(gr);
    return Stack(
      children: [
        PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: [
            for (var i = 0; i < 30; i++) contentBuilder(i, Colors.pink),
          ],
        ),
        const Positioned(left: 20, top: 20, child: Text('ejejeje')),
      ],
    );
  }
}
