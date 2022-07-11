import 'package:flutter/material.dart';

import 'package:worldlingo3/widgets/ProfileTile.dart';

class ProfileGrid extends StatefulWidget {
  const ProfileGrid({Key? key}) : super(key: key);

  @override
  State<ProfileGrid> createState() => _ProfileGridState();
}

class _ProfileGridState extends State<ProfileGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: <Widget>[for (var i = 0; i < 30; i++) ProfileTile(index: i)],
      ),
    );
  }
}
