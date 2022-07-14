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
                      NetworkImage('https://i.pravatar.cc/150?img=$i'),
                ),
                Text(
                  faker.person.firstName(),
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
                    Text(faker.person.name()),
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
                itemCount: 20,
                physics: const AlwaysScrollableScrollPhysics(), // new
                itemBuilder: (ctx, i) {
                  if (i == 0) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey.shade100,
                            child: TextFormField(
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
                        itemBuilder(i)
                      ],
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
