import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

final faker = Faker();

class FindFriendsPage extends StatefulWidget {
  const FindFriendsPage({Key? key}) : super(key: key);

  @override
  State<FindFriendsPage> createState() => _FindFriendsPageState();
}

class _FindFriendsPageState extends State<FindFriendsPage> {
  Widget itemBuilder(i) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$i'),
          ),
          Text(
            faker.person.firstName(),
            style: const TextStyle(color: Colors.black87, fontSize: 10),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 80,
              child: ListView.builder(
                itemCount: 20,
                physics: const AlwaysScrollableScrollPhysics(), // new
                itemBuilder: (ctx, i) {
                  if (i == 0) {
                    return Column(
                      children: [const FlutterLogo(), itemBuilder(i)],
                    );
                  }
                  return itemBuilder(i);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
