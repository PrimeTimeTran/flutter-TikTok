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

title(int currentIdx) {
  switch (currentIdx) {
    case 0:
      {
        return const Text('Users');
      }
    case 1:
      {
        return const Text('Phrases');
      }
    case 2:
      {
        return const Text('TikTok');
      }

    default:
      {
        return const Text('Foo');
      }
  }
}

bottomTabs() {
  return const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Users'),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Phrases'),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'TikTok'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Foo'),
  ];
}

class _DrawerNav extends State<DrawerNav> {
  int currentIdx = 2;

  final screens = [
    const NewsPage(),
    const PhrasePage(),
    const TikTokPage(),
    const FooPage(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title(currentIdx),
      ),
      body: IndexedStack(
        index: currentIdx,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIdx,
          fixedColor: Colors.deepOrange,
          unselectedItemColor: Colors.black87,
          onTap: (idx) => setState(() => currentIdx = idx),
          items: bottomTabs()),
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
