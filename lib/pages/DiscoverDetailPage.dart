import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class DiscoverDetailPage extends StatefulWidget {
  const DiscoverDetailPage({Key? key}) : super(key: key);

  @override
  State<DiscoverDetailPage> createState() => _DiscoverDetailPage();
}

class _DiscoverDetailPage extends State<DiscoverDetailPage> {
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    final fakerFa = Faker();

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Hero(
                tag: 'banner-1',
                child: Image.asset('assets/images/discover-hero.png'),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Text(fakerFa.lorem.sentences(1).join(' '),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  Text(
                    fakerFa.lorem.sentences(2).join(' '),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    fakerFa.lorem.sentences(5).join(' '),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Back')),
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
