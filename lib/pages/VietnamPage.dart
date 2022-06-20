import 'package:flutter/material.dart';

import 'package:worldlingo3/widgets/Box.dart';

class VietnamPage extends StatefulWidget {
  const VietnamPage({Key? key}) : super(key: key);

  @override
  State<VietnamPage> createState() => _VietnamPage();
}

class _VietnamPage extends State<VietnamPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(child: Text('You have pressed the button $_count times.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
