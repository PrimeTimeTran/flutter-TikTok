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
    BottomNavigationBarItem(
      label: 'Users',
      icon: Icon(Icons.home),
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
      label: 'Phrases',
      icon: Icon(Icons.business),
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
      label: 'TikTok',
      icon: Icon(Icons.business),
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
      label: 'Foo',
      icon: Icon(Icons.favorite),
      backgroundColor: Colors.green,
    ),
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
        title: currentIdx != 2 ? title(currentIdx) : null,
        toolbarHeight: currentIdx != 2 ? kToolbarHeight : 0.0,
      ),
      body: IndexedStack(
        index: currentIdx,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs(),
        currentIndex: currentIdx,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.deepOrange,
        onTap: (idx) => setState(() => currentIdx = idx),
      ),
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
