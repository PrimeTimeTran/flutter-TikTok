import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:worldlingo3/widgets/ProfileGrid.dart';

import 'package:worldlingo3/widgets/ProfileTile.dart';

class NestedTabBar extends StatefulWidget {
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late TabController nestedTabController;

  @override
  void initState() {
    super.initState();

    nestedTabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        StickyHeader(
          header: SizedBox(
            width: double.infinity,
            child: Container(
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                controller: nestedTabController,
                labelColor: Colors.grey.shade900,
                indicatorColor: Colors.grey.shade300,
                unselectedLabelColor: Colors.black54,
                labelPadding: const EdgeInsets.symmetric(horizontal: 35.0),
                tabs: const <Widget>[
                  Tab(
                    icon: Icon(Icons.grid_on_rounded),
                  ),
                  Tab(
                    icon: Icon(Icons.lock_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.heart_broken_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.book_outlined),
                  ),
                ],
              ),
            ),
          ),
          content: SizedBox(
            height: screenHeight * 0.90,
            child: TabBarView(
              controller: nestedTabController,
              children: const <Widget>[
                ProfileGrid(),
                ProfileGrid(),
                ProfileGrid(),
                ProfileGrid(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
