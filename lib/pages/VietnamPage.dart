import 'package:flutter/material.dart';

import 'package:worldlingo3/widgets/Box.dart';
import 'package:worldlingo3/pages/VietnamPage2.dart';

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
        backgroundColor: Colors.red,
        title: const Text('Vietnam Page'),
      ),
      body: Center(child: Text('You have pressed the button $_count times.')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        // onPressed: () => setState(() => _count++),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VietnamPage2()),
        ),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
