
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:worldlingo3/pages/DiscoverDetailPage.dart';
import 'package:worldlingo3/widgets/MediaContentPreview.dart';

import 'package:worldlingo3/classes/ContentType.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({
    required this.child,
  }) : super(
            transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
              .animate(animation),
          child: child);
}

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPage();
}

class _DiscoverPage extends State<DiscoverPage> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K'
    ];
    final List<int> colorCodes = <int>[
      600,
      500,
      100,
      200,
      300,
      400,
      500,
      200,
      300,
      400,
      500,
    ];

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              height: MediaQuery.of(context).size.height / 5,
            ),
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            CustomPageRoute(child: const DiscoverDetailPage()));
                      },
                      child: Hero(
                        tag: 'banner-$i',
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(color: Colors.amber),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child:
                                Image.asset('assets/images/discover-hero.png'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: entries.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: height / 5,
                child: ListView.separated(
                  itemCount: mediaList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return MediaContentPreview(id: mediaList[i].id);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Padding(
                    padding: EdgeInsets.all(1),
                    child: Divider(),
                  ),
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
