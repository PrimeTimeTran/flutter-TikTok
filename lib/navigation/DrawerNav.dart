import 'package:flutter/material.dart';
import 'package:worldlingo3/pages/NewsPage.dart';
import 'package:worldlingo3/pages/PhrasePage.dart';
import 'package:worldlingo3/pages/TikTokPage.dart';
import 'package:worldlingo3/pages/FooPage.dart';

class DrawerNav extends StatefulWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  State<DrawerNav> createState() => _DrawerNav();
}

class _DrawerNav extends State<DrawerNav> {
  int currentIdx = 1;

  final screens = [
    const NewsPage(),
    const PhrasePage(),
    const TikTokPage(),
    const FooPage(),
  ];

  title() {
    switch (currentIdx) {
      case 1:
        {
          return const Text('Users');
        }
      case 2:
        {
          return const Text('Phrases');
        }
      case 3:
        {
          return const Text('TikTok');
        }

      default:
        {
          return const Text('Foo');
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title(),
      ),
      body: IndexedStack(
        index: currentIdx,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.deepOrange,
          unselectedItemColor: Colors.black87,
          onTap: (idx) => setState(() {
                currentIdx = idx;
              }),
          currentIndex: currentIdx,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Users'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'Phrases'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'TikTok'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Foo'),
          ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Idol Tran',
                style: TextStyle(color: Colors.amber),
              ),
            ),
            ListTile(
              title: const Text('🇺🇸 United States'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('🇻🇳 Vietnam'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FooPage()),
                );
              },
            ),
            ListTile(
              title: const Text('🇬🇧  United Kingdom'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('🇫🇷 France'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('🇷🇺 Russia'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
