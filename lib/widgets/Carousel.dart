import 'package:flutter/material.dart';

import 'package:worldlingo3/pages/DiscoverDetailPage.dart';

import 'package:carousel_slider/carousel_slider.dart';

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

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: height / 5,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(CustomPageRoute(child: const DiscoverDetailPage()));
                },
                child: Hero(
                  tag: 'banner-$i',
                  child: Container(
                    width: width,
                    decoration: const BoxDecoration(color: Colors.amber),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset('assets/images/discover-hero.png'),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
