// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:worldlingo3/model/user.dart';
import 'package:worldlingo3/api/sheets/user_sheets_api.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPage();
}

class _NewsPage extends State<NewsPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();

    getUsers();
  }

  Future getUsers() async {
    final users = await UserSheetsApi.getAll();
    setState(() {
      this.users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10, (i) => "Item $i");
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            const icon = Icon(Icons.email, color: Colors.red, size: 30);
            return ListTile(
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
              selected: users[index].isNoob == 'false' ? true : false,
              enabled: users[index].isNoob == 'false' ? true : false,
              leading: icon,
            );
          },
        ),
      ),
    );
  }
}
