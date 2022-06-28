import 'package:flutter/material.dart';
import 'package:worldlingo3/pages/DiscoverDetailPage.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({
    required this.child,
  }) : super(
            transitionDuration: const Duration(seconds: 1),
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
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(CustomPageRoute(child: const DiscoverDetailPage()));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const DiscoverDetailPage()),
                // );
              }, // Image tapped
              child: Hero(
                tag: 'banner',
                child: Image.asset('assets/images/discover-hero.png'),
              ),
            ),
            Text('You have pressed the button $_count times.')
          ],
        ),
      ),
    );
  }
}
