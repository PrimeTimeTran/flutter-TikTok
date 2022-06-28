import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:worldlingo3/pages/DiscoverDetailPage.dart';

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
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
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
                          Navigator.of(context).push(CustomPageRoute(
                              child: const DiscoverDetailPage()));
                        },
                        child: Hero(
                          tag: 'banner-$i',
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                const BoxDecoration(color: Colors.amber),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                  'assets/images/discover-hero.png'),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Text('You have pressed the button $_count times.')
          ],
        ),
      ),
    );
  }
}
