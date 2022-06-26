import 'package:flutter/material.dart';

import 'package:worldlingo3/pages/VietnamPage2.dart';

class FooPage extends StatefulWidget {
  const FooPage({Key? key}) : super(key: key);

  @override
  State<FooPage> createState() => _FooPage();
}

class _FooPage extends State<FooPage> {
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('You have pressed the button $_count times.')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment Counter',
        backgroundColor: Colors.red,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VietnamPage2()),
        ),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
