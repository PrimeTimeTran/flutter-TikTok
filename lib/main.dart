import 'package:flutter/material.dart';

import 'package:worldlingo3/api/sheets/user_sheets_api.dart';
import 'package:worldlingo3/api/sheets/phrase_sheets_api.dart';
import 'navigation/DrawerNav.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  await PhraseSheetsApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerNav(),
    );
  }
}
