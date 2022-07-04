
import 'package:flutter/material.dart';

import 'package:worldlingo3/model/user.dart';
import 'package:worldlingo3/api/sheets/user_sheets_api.dart';

class VietnamPage2 extends StatefulWidget {
  const VietnamPage2({Key? key}) : super(key: key);

  @override
  State<VietnamPage2> createState() => _VietnamPage();
}

class _VietnamPage extends State<VietnamPage2> {
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('Vietnam Page 2');
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.dark,
        title: const Text('Vietnam2 Page'),
      ),
      body: Center(child: Text('You have pressed the button $_count times.')),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.yellow,
        onPressed: () async {
          final user = {
            UserFields.id: 1,
            UserFields.name: 'Idol',
            UserFields.email: 'idoltran@gmail.com',
            UserFields.isNoob: 'true'
          };
          await UserSheetsApi.insert([user]);
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
