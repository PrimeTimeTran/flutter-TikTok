import 'package:flutter/material.dart';

import 'package:worldlingo3/navigation/DrawerNav.dart';
import 'package:worldlingo3/widgets/MediaContent.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DrawerNav(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/media-content': (context) => const MediaContent(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          size: 28,
          color: Colors.black54,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black87),
          iconTheme: IconThemeData(
            size: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
