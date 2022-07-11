import 'package:flutter/material.dart';

import 'package:faker/faker.dart';

final faker = Faker();

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPage();
}

class _InboxPage extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/250?image=$i'),
                      ),
                      Text(
                        faker.person.firstName(),
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 10),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(children: const [Text('Messages')]),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 20,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (ctx, i) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/250?image=$i'),
                ),
                title: Text(faker.person.name()),
                subtitle: Text(faker.lorem.sentences(1).join()),
                trailing: const Icon(Icons.more_vert),
              );
            },
          ),
        ],
      ),
    );
  }
}
