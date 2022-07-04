import 'package:flutter/material.dart';
import 'dart:math';

final _random = Random();

int randomNum() => 1 + _random.nextInt(100 - 1);

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key key, this.title}) : super(key: key);

  // final String title;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TabBar(
          isScrollable: true,
          labelColor: Colors.teal,
          indicatorColor: Colors.teal,
          controller: _nestedTabController,
          unselectedLabelColor: Colors.black54,
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
                  padding: const EdgeInsets.all(1),
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      color: Colors.teal[100],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[200],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[300],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[400],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[500],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[600],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[100],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[200],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[300],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[400],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[500],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[600],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[100],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[200],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[300],
                      child: Image.network(getImageUrl()),
                    ),
                    Container(
                      color: Colors.teal[400],
                      child: Image.network(getImageUrl()),
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
        title: const Text('AppBar'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
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
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
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
                          return null; // Defer to the widget's default.
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
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const Text('Hello World'),
          ),
          NestedTabBar(),
        ],
      ),
    );
  }
}
