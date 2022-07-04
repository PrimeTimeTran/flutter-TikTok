import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:worldlingo3/pages/VietnamPage2.dart';

final _random = Random();

int randomNum() => 1 + _random.nextInt(100 - 1);

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.teal,
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.black54,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.email),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("Home"),
          ),
          Center(
            child: Text("Email"),
          ),
          Center(
            child: Text("Settings"),
          )
        ],
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  getImageUrl() {
    return "https://picsum.photos/250?image=${randomNum()}";
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: TabBar(
            isScrollable: true,
            controller: _nestedTabController,
            labelColor: Colors.grey.shade400,
            indicatorColor: Colors.grey.shade700,
            unselectedLabelColor: Colors.black54,
            labelPadding: const EdgeInsets.symmetric(horizontal: 35),
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.grid_on_rounded),
              ),
              Tab(
                icon: Icon(Icons.lock_outline),
              ),
              Tab(icon: Icon(Icons.heart_broken)),
              Tab(icon: Icon(Icons.book_outlined)),
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * 0.70,
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: GridView.count(
                  primary: false,
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: (9 / 10),
                  padding: const EdgeInsets.all(1),
                  children: <Widget>[
                    for (var i = 0; i < 30; i++)
                      Container(
                        child: Image.network(getImageUrl(), fit: BoxFit.cover),
                      ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.orangeAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.greenAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.indigoAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ProfilePage extends State<ProfilePage> {
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Loi Tran'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VietnamPage2()),
            );
          },
          icon: const Icon(Icons.people_alt_outlined),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              showAdaptiveActionSheet(
                context: context,
                actions: <BottomSheetAction>[
                  BottomSheetAction(
                    title: const Text(
                      'Creator Tools',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                    leading:
                        const Icon(Icons.phonelink_setup_outlined, size: 25),
                  ),
                  BottomSheetAction(
                    title: const Text(
                      'Settings & Privacy',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                    leading: const Icon(
                      Icons.settings,
                      size: 25,
                    ),
                  ),
                ],
              );
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const CircleAvatar(
                      radius: 48,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/250?image=1'),
                    ),
                  ),
                  const Text(
                    "@primetimetran",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "117",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "82",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "249",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Likes",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blue.withOpacity(0.12);
                          }
                          return null;
                        },
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Edit Profile'),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: const Text(
              '💯☮️🙇🏻‍♂️🐒🤔👨🏻‍🎓🥋🧑🏻‍💻 👨🏻‍🏫 👨🏻‍🍳 ✍️🗽🦁🔫💂🏻‍♀️🌏🇺🇸🇻🇳🧙🏻‍♂️',
              textAlign: TextAlign.center,
            ),
          ),
          NestedTabBar(),
        ],
      ),
    );
  }
}
