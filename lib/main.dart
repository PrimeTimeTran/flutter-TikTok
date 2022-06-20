import 'package:flutter/material.dart';
import 'package:worldlingo3/navigation/DrawerNav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'World Wide Words';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: DrawerNav(title: appTitle),
    );
  }
}
