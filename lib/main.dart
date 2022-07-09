
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:worldlingo3/api/sheets/user_sheets_api.dart';
import 'package:worldlingo3/api/sheets/phrase_sheets_api.dart';

import 'package:worldlingo3/navigation/DrawerNav.dart';

import 'package:worldlingo3/widgets/MediaContent.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  await PhraseSheetsApi.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAnalytics.instance.logBeginCheckout(
      value: 10.0,
      currency: 'USD',
      items: [
        AnalyticsEventItem(itemName: 'Socks', itemId: 'xjw73ndnw', price: 10),
      ],
      coupon: '10PERCENTOFF');

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
        appBarTheme: const AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black87),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            size: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
