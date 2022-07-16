import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

final faker = Faker();

class User {
  final String name;
  final int idx;
  const User({required this.name, required this.idx});
}

class FindFriendsPage extends StatefulWidget {
  const FindFriendsPage({Key? key}) : super(key: key);

  @override
  State<FindFriendsPage> createState() => _FindFriendsPageState();
}

class _FindFriendsPageState extends State<FindFriendsPage> {
  late List<User> users = [];
  late List<User> usersCopy = [];
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    users = [];

    for (var i = 0; i < 50; i += 1) {
      var user = User(name: faker.person.name(), idx: i);
      users.add(user);
    }
    usersCopy = users;
  }

  void searchUsers(String query) {
    final suggestions = users.where((u) {
      final name = u.name.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();
    setState(() {
      usersCopy = suggestions;
    });
  }

  Widget itemBuilder(user) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=${user.idx}'),
                ),
                Text(
                  user.name,
                  style: const TextStyle(color: Colors.black87, fontSize: 10),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name),
                    const Text('Follows you'),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      fixedSize: const Size(100, 15),
                      backgroundColor: Colors.red.shade400,
                      textStyle: const TextStyle(fontSize: 10)),
                  child: const Text('Follow Back'),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.close, size: 20),
                ),
              ],
            )
          ],
        ),
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
                itemCount: usersCopy.length,
                physics: const AlwaysScrollableScrollPhysics(), // new
                itemBuilder: (ctx, i) {
                  final user = usersCopy[i];
                  if (i == 0) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey.shade100,
                            child: TextFormField(
                              controller: myController,
                              onChanged: searchUsers,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'Search users',
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                fillColor: Colors.grey.shade100,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        itemBuilder(user)
                      ],
                    );
                  }
                  return itemBuilder(user);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
