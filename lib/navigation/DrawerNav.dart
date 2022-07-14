import 'package:flutter/material.dart';
import 'package:worldlingo3/pages/TikTokPage.dart';
import 'package:worldlingo3/pages/DiscoverPage.dart';
import 'package:worldlingo3/pages/PhrasePage.dart';
import 'package:worldlingo3/pages/InboxPage.dart';
import 'package:worldlingo3/pages/ProfilePage.dart';

import 'package:worldlingo3/widgets/CustomTabIcon.dart';

class DrawerNav extends StatefulWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  State<DrawerNav> createState() => _DrawerNav();
}

title(int currentIdx) {
  switch (currentIdx) {
    case 0:
      {
        return const Text('Home');
      }
    case 1:
      {
        return const Text('Discover');
      }
    case 2:
      {
        return const Text('TikTok');
      }
    case 3:
      {
        return const Text('Inbox');
      }

    default:
      {
        return const Text('Profile');
      }
  }
}

bottomTabs() {
  return const [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: 'Discover',
      icon: Icon(Icons.arrow_circle_up_sharp),
    ),
    BottomNavigationBarItem(
      icon: CustomTabIcon(),
      label: '',
    ),
    BottomNavigationBarItem(
      label: 'Inbox',
      icon: Icon(Icons.inbox),
    ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(Icons.account_box_rounded),
    ),
  ];
}

class _DrawerNav extends State<DrawerNav> {
  int currentIdx = 1;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TikTokPage(),
    DiscoverPage(),
    PhrasePage(),
    InboxPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ![0, 2, 4].contains(currentIdx)
          ? AppBar(
              title: currentIdx != 2 ? title(currentIdx) : null,
            )
          : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        bottom: true,
        minimum: const EdgeInsets.only(bottom: 10),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black45,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Discover',
              icon: Icon(Icons.arrow_circle_up_sharp),
            ),
            BottomNavigationBarItem(
              icon: CustomTabIcon(),
              label: '',
            ),
            BottomNavigationBarItem(
              label: 'Inbox',
              icon: Icon(Icons.inbox),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.account_box_rounded),
            ),
          ],
        ),
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
              },
            ),
            ListTile(
              title: const Text('🇬🇧  United Kingdom'),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text('🇫🇷 France'),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text('🇷🇺 Russia'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
