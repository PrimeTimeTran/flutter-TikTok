import 'package:flutter/material.dart';

import 'package:worldlingo3/widgets/Box.dart';

class VietnamPage2 extends StatefulWidget {
  const VietnamPage2({Key? key}) : super(key: key);

  @override
  State<VietnamPage2> createState() => _VietnamPage();
}

class _VietnamPage extends State<VietnamPage2> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Vietnam2 Page'),
      ),
      body: Center(child: Text('You have pressed the button $_count times.')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () => setState(() => _count++),
        // onPressed: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const VietnamPage2()),
        // ),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
