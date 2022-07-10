import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class DiscoverDetailPage extends StatefulWidget {
  const DiscoverDetailPage({Key? key, this.i = 1}) : super(key: key);
  final int i;

  @override
  State<DiscoverDetailPage> createState() => _DiscoverDetailPage();
}

class _DiscoverDetailPage extends State<DiscoverDetailPage> {
  final int _count = 0;


  @override
  Widget build(BuildContext context) {
    final i = widget.i;
    debugPrint('Detail Discover-0$i.png');
    final fakerFa = Faker();
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Hero(
                tag: 'Discover-0$i.png',
                child: Image.asset('assets/images/Discover-0$i.png'),
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
